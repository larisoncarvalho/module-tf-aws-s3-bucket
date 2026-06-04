# Terraform Infrastructure Documentation

## 1. Overview

This Terraform codebase manages a small EC2 infrastructure stack deployed in AWS region `eu-central-1`. The infrastructure was discovered from existing cloud resources and codified via **Infrastructure-as-Code-from-Cloud** (infra2code) generation. All resources were imported into Terraform state until `terraform plan` showed zero changes (0 to add, 0 to change, 0 to destroy), ensuring a clean reconciliation.

**What is managed:**
- **1 EC2 instance** (t2.medium Ubuntu-based runner, stopped state)
- **1 EBS volume** (32 GiB gp3, root volume of the instance)
- **1 EC2 key pair** (for SSH authentication)
- **1 network interface** (primary ENI attached to the instance)
- **Cross-references** to existing VPC, subnet, and security group (not managed in this code)

The code is environment-agnostic: all cloud resource IDs and configuration are parameterized via a single tfvars file (`environments/sg.tfvars`), allowing seamless migration to different environments by copying and editing the file.

---

## 2. Resources

| Terraform Address | Provider Type | Cloud ID | Real-world Name | Purpose |
|---|---|---|---|---|
| `module.instance["taher_private_runner_ubuntu"].aws_instance.this` | `aws_instance` | `i-0a0ca27d00e7e74b9` | taher-private-runner-ubuntu | EC2 compute instance running Ubuntu with t2.medium instance type. Configured with IMDSv2 required tokens and source/dest check enabled. |
| `module.ebs_volume["vol_072212cd519ee269f"].aws_ebs_volume.this` | `aws_ebs_volume` | `vol-072212cd519ee269f` | vol-072212cd519ee269f | Root EBS volume (32 GiB, gp3, 3000 IOPS, 125 MB/s throughput) created from snapshot `snap-0a07d122afed3f01c`. |
| `module.key_pair["taher_private_runner"].aws_key_pair.this` | `aws_key_pair` | `key-07b4fecdf3b13a3b9` | taher-private-runner | EC2 key pair for SSH authentication. Public key material is write-only (not returned by AWS API after creation). |
| `module.network_interface["eni_0ad57450ced1dd2d6"].aws_network_interface.this` | `aws_network_interface` | `eni-0ad57450ced1dd2d6` | eni-0ad57450ced1dd2d6 | Primary network interface (ENI) with private IP `10.0.0.52`, attached to instance via root module. Attachment is managed by `aws_instance`, not duplicated here. |

---

## 3. Module Structure

### Root Module (`/modules/` parent)

**Path:** `/mnt/sg_workspace/user/sgcode/`

**Purpose:** Wire together four child modules via `for_each` loops. Contains no bare resource blocks.

**Files:**
- `main.tf` — Four module blocks (`instance`, `ebs_volume`, `key_pair`, `network_interface`), each looping over a map from root variables
- `variables.tf` — Four root-level variables (maps of object types), one per resource type
- `outputs.tf` — Re-exports outputs from child modules as root-level outputs
- `providers.tf` — AWS provider configured for `eu-central-1` region
- `versions.tf` — Terraform version constraints; requires AWS provider

**Child Modules:** (all local modules, no external git sources)

---

### Module: `instance` (`modules/instance/`)

**Manages:** A single EC2 instance (`aws_instance.this`).

**Configuration:**
- Instance type, AMI ID, key pair, subnet, security groups, and availability zone are all parameterized
- Nested `metadata_options` block for IMDSv2 settings
- Nested `root_block_device` block for root volume configuration (size, type, IOPS, throughput, delete-on-termination)
- Tags applied directly from input

**Variables:**
- `ami` (string, required) — AMI ID
- `instance_type` (string, required) — e.g., `t2.medium`
- `key_name` (string, required) — Key pair name for SSH
- `subnet_id` (string, required) — Subnet ID
- `vpc_security_group_ids` (list of strings, required) — Security group IDs
- `availability_zone` (string, required)
- `monitoring` (bool, optional, default: false)
- `ebs_optimized` (bool, optional, default: false)
- `source_dest_check` (bool, optional, default: true)
- `tenancy` (string, optional, default: "default")
- `metadata_http_endpoint` (string, optional, default: "enabled")
- `metadata_http_put_response_hop_limit` (number, optional, default: 1)
- `metadata_http_tokens` (string, optional, default: "optional")
- `metadata_instance_metadata_tags` (string, optional, default: "disabled")
- `metadata_http_protocol_ipv6` (string, optional, default: "disabled")
- `root_delete_on_termination` (bool, optional, default: true)
- `root_volume_type` (string, optional, default: "gp2")
- `root_volume_size` (number, required)
- `root_iops` (number, optional, default: null)
- `root_throughput` (number, optional, default: null)
- `tags` (map of strings, optional, default: {})

**Outputs:**
- `instance_id` — AWS instance ID
- `private_ip` — Primary private IP
- `public_ip` — Public IP (if any)

---

### Module: `ebs_volume` (`modules/ebs_volume/`)

**Manages:** A single standalone EBS volume (`aws_ebs_volume.this`).

**Purpose:** Model a volume that may be independent or attached to an instance. In this case, it is the root volume of the instance but is managed as a separate resource to match discovered state.

**Variables:**
- `availability_zone` (string, required) — AZ in which to create the volume
- `size` (number, required) — Volume size in GiB
- `type` (string, optional, default: "gp2") — Volume type (gp2, gp3, io1, io2, etc.)
- `iops` (number, optional, default: null) — Provisioned IOPS
- `throughput` (number, optional, default: null) — Throughput in MiB/s (for gp3)
- `encrypted` (bool, optional, default: false)
- `snapshot_id` (string, optional, default: null) — Snapshot ID to create from
- `tags` (map of strings, optional, default: {})

**Outputs:**
- `volume_id` — AWS volume ID
- `arn` — Volume ARN

---

### Module: `key_pair` (`modules/key_pair/`)

**Manages:** A single EC2 key pair (`aws_key_pair.this`).

**Special Handling:**
- The `public_key` argument is **write-only**: AWS returns it in the API but as `null` in discovery.
- To avoid perpetual drift, `public_key` is set to a placeholder string in tfvars and excluded from change detection via `lifecycle { ignore_changes = [public_key] }`.
- The variable is marked `sensitive = true` to redact it in logs.

**Variables:**
- `key_name` (string, required) — Key pair name
- `public_key` (string, required, sensitive) — Public key material (use placeholder if not available)
- `tags` (map of strings, optional, default: {})

**Outputs:**
- `key_pair_id` — AWS key pair ID
- `key_name` — Key pair name

**Lifecycle Rules:**
- `ignore_changes = [public_key]` — Prevents spurious drift on the write-only attribute

---

### Module: `network_interface` (`modules/network_interface/`)

**Manages:** A single network interface (`aws_network_interface.this`).

**Special Handling:**
- The ENI's attachment metadata (device index, instance association) is **intentionally not managed** here.
- Attachment is controlled by the `aws_instance` module instead, to avoid conflicts between dual management.
- The ENI itself (IP addresses, security groups, source/dest check) is fully managed here.

**Variables:**
- `subnet_id` (string, required) — Subnet ID
- `private_ips` (list of strings, required) — List of private IP addresses
- `security_groups` (list of strings, required) — Security group IDs
- `source_dest_check` (bool, optional, default: true)
- `description` (string, optional, default: "")
- `tags` (map of strings, optional, default: {})

**Outputs:**
- `network_interface_id` — AWS ENI ID
- `private_ip` — Primary private IP

---

## 4. How Import Works

### Import Process

All four discovered resources are already imported into Terraform state. The import was performed via the `imports.sh` script, which maps each Terraform resource address to its cloud ID.

**File:** `imports.sh`

**Import commands executed:**

```bash
terraform import -var-file environments/sg.tfvars 'module.instance["taher_private_runner_ubuntu"].aws_instance.this' 'i-0a0ca27d00e7e74b9'
terraform import -var-file environments/sg.tfvars 'module.ebs_volume["vol_072212cd519ee269f"].aws_ebs_volume.this' 'vol-072212cd519ee269f'
terraform import -var-file environments/sg.tfvars 'module.key_pair["taher_private_runner"].aws_key_pair.this' 'taher-private-runner'
terraform import -var-file environments/sg.tfvars 'module.network_interface["eni_0ad57450ced1dd2d6"].aws_network_interface.this' 'eni-0ad57450ced1dd2d6'
```

**Why this format:**
- Each resource is in a module called via `for_each`, so the address is `module.<module_name>["<map_key>"].<resource_type>.this`.
- The map keys are sanitized versions of cloud resource names/IDs (hyphens → underscores) for HCL compatibility.
- The import ID (last argument) is the cloud resource identifier (instance ID, volume ID, key pair name, ENI ID).
- **Note for key pair:** AWS key pairs are imported by **name** (`taher-private-runner`), not by resource ID.

### Re-importing a Single Resource

If state is lost for one resource, re-import it by running:

```bash
terraform import -var-file environments/sg.tfvars 'module.<module_name>["<map_key>"].<resource_type>.this' '<cloud_id>'
```

Example (re-import the instance):

```bash
terraform import -var-file environments/sg.tfvars 'module.instance["taher_private_runner_ubuntu"].aws_instance.this' 'i-0a0ca27d00e7e74b9'
```

The `-var-file` flag is essential: it ensures variables are available during import (e.g., map keys are validated).

---

## 5. How to Use the Code

### Prerequisites

- Terraform or OpenTofu >= 1.0 installed at `/tmp/tmp.Pgmegn/terraform` (or as `terraform` in PATH)
- AWS credentials configured (via `~/.aws/credentials`, environment variables, or IAM instance profile)
- Working directory: `/mnt/sg_workspace/user/sgcode`

### Initialize

Initialize Terraform and download provider plugins:

```bash
cd /mnt/sg_workspace/user/sgcode
terraform init
```

### Plan

Preview changes (should show 0/0/0 if state is already reconciled):

```bash
terraform plan -var-file=environments/sg.tfvars
```

### Apply

Apply changes (if any):

```bash
terraform apply -var-file=environments/sg.tfvars
```

You will be prompted to confirm. To auto-approve (for scripts):

```bash
terraform apply -var-file=environments/sg.tfvars -auto-approve
```

### Target Another Environment

To deploy to a different environment (e.g., production):

1. **Copy the tfvars file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the values in the new file:**
   ```bash
   # environments/prod.tfvars
   instances = {
     taher_prod_runner = {
       ami                    = "ami-xxxxx"  # Update as needed
       instance_type          = "t3.large"   # Different size
       # ... update other values ...
     }
   }
   ```

3. **Plan and apply with the new file:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   terraform apply -var-file=environments/prod.tfvars
   ```

**No `.tf` files are modified** — all environment-specific configuration lives in `tfvars` files.

### Destroy All Resources

```bash
terraform destroy -var-file=environments/sg.tfvars
```

---

## 6. Variables

All variables are defined in the root module (`variables.tf`) as maps of objects. One entry per discovered resource. Edit `environments/sg.tfvars` to scale.

### `var.instances` (map of objects)

**Description:** EC2 instance configurations.

**Type:**
```hcl
map(object({
  ami                                  = string
  instance_type                        = string
  key_name                             = string
  subnet_id                            = string
  vpc_security_group_ids               = list(string)
  availability_zone                    = string
  monitoring                           = bool
  ebs_optimized                        = bool
  source_dest_check                    = bool
  tenancy                              = string
  metadata_http_endpoint               = string
  metadata_http_put_response_hop_limit = number
  metadata_http_tokens                 = string
  metadata_instance_metadata_tags      = string
  metadata_http_protocol_ipv6          = string
  root_delete_on_termination           = bool
  root_volume_type                     = string
  root_volume_size                     = number
  root_iops                            = optional(number, null)
  root_throughput                      = optional(number, null)
  tags                                 = optional(map(string), {})
}))
```

**Example (from sg.tfvars):**
```hcl
instances = {
  taher_private_runner_ubuntu = {
    ami                                  = "ami-03250b0e01c28d196"
    instance_type                        = "t2.medium"
    key_name                             = "taher-private-runner"
    subnet_id                            = "subnet-072669658da496c4a"
    vpc_security_group_ids               = ["sg-092a5ff991a0802bc"]
    availability_zone                    = "eu-central-1a"
    monitoring                           = false
    ebs_optimized                        = false
    source_dest_check                    = true
    tenancy                              = "default"
    metadata_http_endpoint               = "enabled"
    metadata_http_put_response_hop_limit = 2
    metadata_http_tokens                 = "required"
    metadata_instance_metadata_tags      = "disabled"
    metadata_http_protocol_ipv6          = "disabled"
    root_delete_on_termination           = true
    root_volume_type                     = "gp3"
    root_volume_size                     = 32
    root_iops                            = 3000
    root_throughput                      = 125
    tags = { Name = "taher-private-runner-ubuntu" }
  }
}
```

---

### `var.ebs_volumes` (map of objects)

**Description:** EBS volume configurations.

**Type:**
```hcl
map(object({
  availability_zone = string
  size              = number
  type              = string
  iops              = optional(number, null)
  throughput        = optional(number, null)
  encrypted         = bool
  snapshot_id       = optional(string, null)
  tags              = optional(map(string), {})
}))
```

**Example:**
```hcl
ebs_volumes = {
  vol_072212cd519ee269f = {
    availability_zone = "eu-central-1a"
    size              = 32
    type              = "gp3"
    iops              = 3000
    throughput        = 125
    encrypted         = false
    snapshot_id       = "snap-0a07d122afed3f01c"
    tags              = {}
  }
}
```

---

### `var.key_pairs` (map of objects)

**Description:** EC2 key pair configurations.

**Type:**
```hcl
map(object({
  key_name   = string
  public_key = string
  tags       = optional(map(string), {})
}))
```

**Example:**
```hcl
key_pairs = {
  taher_private_runner = {
    key_name   = "taher-private-runner"
    public_key = "placeholder"  # Write-only; placeholder is ignored after import
    tags       = {}
  }
}
```

---

### `var.network_interfaces` (map of objects)

**Description:** EC2 network interface configurations.

**Type:**
```hcl
map(object({
  subnet_id         = string
  private_ips       = list(string)
  security_groups   = list(string)
  source_dest_check = bool
  description       = optional(string, "")
  tags              = optional(map(string), {})
}))
```

**Example:**
```hcl
network_interfaces = {
  eni_0ad57450ced1dd2d6 = {
    subnet_id         = "subnet-072669658da496c4a"
    private_ips       = ["10.0.0.52"]
    security_groups   = ["sg-092a5ff991a0802bc"]
    source_dest_check = true
    description       = ""
    tags              = {}
  }
}
```

---

## 7. Infrastructure Graph

```
aws_instance (taher-private-runner-ubuntu)
├── (ami)
│   └── ami-03250b0e01c28d196
├── (key_name)
│   └── aws_key_pair (taher-private-runner)
├── (vpc_security_group_ids)
│   └── sg-092a5ff991a0802bc [unmanaged, external reference]
├── (subnet_id)
│   └── subnet-072669658da496c4a [unmanaged, external reference]
├── (root_block_device)
│   └── aws_ebs_volume (vol-072212cd519ee269f)
│       ├── (snapshot_id)
│       │   └── snap-0a07d122afed3f01c
│       └── (availability_zone)
│           └── eu-central-1a
└── (network_interface via primary ENI)
    └── aws_network_interface (eni-0ad57450ced1dd2d6)
        ├── (security_groups)
        │   └── sg-092a5ff991a0802bc [unmanaged, external reference]
        ├── (subnet_id)
        │   └── subnet-072669658da496c4a [unmanaged, external reference]
        └── (private_ips)
            └── 10.0.0.52

Legend:
- Items in (parentheses) = Terraform arguments/attributes
- Items without parens = Resource names/IDs
- [unmanaged] = Not managed by this code; external references
- Dependencies flow downward (parent → child / uses)
```

**Key dependency notes:**
- The instance depends on the key pair by name
- The instance configures root block device volume properties that align with the standalone EBS volume
- The instance and ENI are connected implicitly (instance attachment); ENI attachment is not explicitly declared in the ENI module to avoid conflicts
- VPC, subnet, security groups are **external references** (discovered but not managed); they must exist before plan/apply

---

## 8. Notable Decisions & Caveats

### Resource Decomposition

**Instance + EBS Volume (dual representation):**
The root EBS volume is defined in two places:
1. As `root_block_device` nested inside `aws_instance` (instance module)
2. As a standalone `aws_ebs_volume` (ebs_volume module)

This is intentional: discovery found both representations in the cloud, and importing both keeps them in sync without conflicts. The standalone volume allows independent management (e.g., resize, snapshot, encrypt) without altering the instance. After import and reconciliation, the plan shows no spurious changes.

**Instance + Network Interface (attachment management):**
The primary ENI (device_index=0) is attached to the instance, but attachment is managed **only** by `aws_instance`, not by `aws_network_interface`. The ENI module omits any `attachment` block to avoid duplicate resource management. This is a deliberate design choice: the instance "owns" the attachment relationship.

---

### Write-only Attributes (Public Key)

**aws_key_pair.public_key:**
- The `public_key` argument is **write-only**: AWS accepts it at creation but never returns it in describe calls
- Discovered state holds `null` for this attribute
- To avoid perpetual drift on reimport, a placeholder string (`"placeholder"`) is supplied in `sg.tfvars`
- The variable is marked `sensitive = true` to redact logs
- Lifecycle rule `ignore_changes = [public_key]` ensures Terraform never detects drift on this attribute
- **Implication:** The real public key material is **not recoverable** from state. If the key pair needs to be rotated, it must be managed outside Terraform or a new key pair created

---

### Import ID Correction

**aws_key_pair import:**
- EC2 key pairs are imported by **name** (e.g., `taher-private-runner`), not by resource ID (`key-07b4fecdf3b13a3b9`)
- The `imports.sh` script correctly uses the key name

---

### Computed Attributes Not Codified

The following attributes are discovered but not explicitly set in code (they are computed by AWS and will be inferred):
- `arn` on instances and volumes
- `instance_state` (instance is in `stopped` state post-creation, which is an operational state, not a launch-time configuration)
- `launch_time`, `state_transition_time` (metadata, not configuration)
- Network interface metadata: `attachment_id`, `attached_instance_id`, `status`, `mac_address`, `owner_id` (all derived from attachment)
- Volume attachment info: `attachment_status`, `attachment_time`, `attached_instance_id` (derived from instance attachment)

These are omitted from configuration because they are read-only or state-dependent; including them would cause spurious drift.

---

### No Remaining Drift

After one iteration of import and reconciliation:
- Plan shows **0 to add, 0 to change, 0 to destroy**
- All managed resources match their configuration in tfvars
- Lifecycle rules and placeholder values prevent false positives

The stack is clean and production-ready.

---

### External References

The following AWS resources are **referenced but not managed** by this code:
- **VPC:** `vpc-0119b9388f2104572` (from which subnet is derived)
- **Subnet:** `subnet-072669658da496c4a` (must exist)
- **Security Group:** `sg-092a5ff991a0802bc` (must exist, used by instance and ENI)
- **AMI:** `ami-03250b0e01c28d196` (must exist and be accessible)
- **Snapshot:** `snap-0a07d122afed3f01c` (used to create the root volume)

These should be managed separately or ensured to exist in the target environment before applying this stack.

---

### Region and Provider

- **Region:** Hardcoded to `eu-central-1` in `providers.tf`
- No cross-region support without modifying provider configuration
- To deploy to a different region, edit `providers.tf` and update all `availability_zone` and subnet/VPC references in tfvars

---

## Appendix: File Structure

```
/mnt/sg_workspace/user/sgcode/
├── .sg/
│   └── handoff.md          # Per-module layout, import corrections, design notes
│   └── DOCUMENTATION.md    # This file
├── main.tf                 # Root module: four for_each loops
├── variables.tf            # Root-level input variables (maps)
├── outputs.tf              # Root-level outputs (re-exported from modules)
├── providers.tf            # AWS provider (eu-central-1)
├── versions.tf             # Terraform/provider requirements
├── imports.sh              # Shell script: terraform import commands
├── environments/
│   └── sg.tfvars           # Default environment: all resource configs
└── modules/
    ├── instance/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── ebs_volume/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── key_pair/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── network_interface/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

**Generated:** 2026-06-04  
**Infrastructure:** EC2 instance + EBS volume + key pair + ENI  
**Region:** eu-central-1  
**State:** Reconciled (0/0/0)
