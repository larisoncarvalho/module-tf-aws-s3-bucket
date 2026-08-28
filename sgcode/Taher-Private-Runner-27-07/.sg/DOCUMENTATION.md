# Infrastructure Documentation

## 1. Overview

This Terraform configuration manages EC2 infrastructure resources in AWS (region: `eu-central-1`). The infrastructure was generated from discovered cloud resources using an infra2code agent, imported into state using `imports.sh`, and reconciled until the Terraform plan showed **0 changes, 0 additions, 0 destructions** — confirming perfect state alignment.

**Final reconciliation result:** ✅ No changes. Infrastructure matches configuration.

The stack consists of:
- **1 EC2 Instance** (`taher-private-runner-amz`) — a t2.medium with 2 vCPU cores and 1 thread per core
- **1 EBS Volume** (`vol-0eee7b20020c3cdac`) — a 24 GiB gp3 volume attached to the instance
- **1 Network Interface** (`eni-0cde3d4209449554a`) — primary ENI with private IP 10.0.0.41 in subnet subnet-072669658da496c4a
- **Key pair reference** (`taher-private-runner`) — phantom resource (discovered but deleted before import; excluded from state)

All resources are centrally orchestrated via root-level variables (in `environments/sg.tfvars` and `secrets.auto.tfvars`) and distributed across four reusable modules.

---

## 2. Resources

| Terraform Address | Type | Provider | Real-world Name/ID | Purpose |
|---|---|---|---|---|
| `module.instance["taher_private_runner_amz"].aws_instance.this` | `aws_instance` | AWS EC2 | `i-01494deda99ac7624` | Primary compute instance (t2.medium, 2 cores, 1 thread/core, instance store: gp3 24 GiB) |
| `module.ebs_volume["vol_0eee7b20020c3cdac"].aws_ebs_volume.this` | `aws_ebs_volume` | AWS EBS | `vol-0eee7b20020c3cdac` | Root EBS volume (24 GiB gp3, 3000 IOPS, 125 MiB/s throughput) attached to instance |
| `module.network_interface["eni_0cde3d4209449554a"].aws_network_interface.this` | `aws_network_interface` | AWS EC2 | `eni-0cde3d4209449554a` | Primary network interface with private IP 10.0.0.41, security group sg-092a5ff991a0802bc |
| `module.key_pair[…]` | `aws_key_pair` | AWS EC2 | (phantom) | Key pair module exists but no entries in state; real key pair (`taher-private-runner`, key-07b4fecdf3b13a3b9) was discovered but deleted before import |

---

## 3. Module Structure

### Module: `modules/instance/`

**Purpose:** Wraps `aws_instance` with dynamic blocks for optional configurations.

**Inputs (from root `var.instances` map):**
- `ami` (required) — AMI ID
- `instance_type` (required) — e.g., `t2.medium`
- `subnet_id` (required) — VPC subnet
- `vpc_security_group_ids` (optional, list) — security groups
- `key_name` (optional) — key pair name
- `availability_zone` (optional) — explicit AZ
- `tenancy` (optional, default: `"default"`) — tenancy mode
- `ebs_optimized` (optional, default: `false`)
- `source_dest_check` (optional, default: `true`)
- `monitoring` (optional, default: `false`)
- `hibernation` (optional, default: `false`)
- `enclave_options_enabled` (optional, default: `false`)
- `root_block_device` (optional, object) — volume configuration (type, size, IOPS, throughput, delete_on_termination, encrypted)
- `metadata_options` (optional, object) — IMDSv2 settings
- `cpu_options` (optional, object) — core and thread counts
- `tags` (optional, map, default: `{}`)

**Outputs:**
- `id` — instance ID
- `arn` — instance ARN
- `public_ip` — public IP (if assigned)
- `private_ip` — private IP

**Call style:** `for_each` (key: `taher_private_runner_amz`)

---

### Module: `modules/ebs_volume/`

**Purpose:** Wraps `aws_ebs_volume` for standalone volume management.

**Inputs (from root `var.ebs_volumes` map):**
- `availability_zone` (required) — AZ where volume resides
- `size` (required) — size in GiB
- `volume_type` (optional, default: `"gp3"`) — volume type (gp3, io1, io2, etc.)
- `iops` (optional) — provisioned IOPS (for gp3, io1, io2)
- `throughput` (optional) — throughput in MiB/s (gp3 only)
- `encrypted` (optional, default: `false`)
- `snapshot_id` (optional) — snapshot to restore from
- `multi_attach_enabled` (optional, default: `false`)
- `tags` (optional, map, default: `{}`)

**Outputs:**
- `id` — volume ID
- `arn` — volume ARN

**Call style:** `for_each` (key: `vol_0eee7b20020c3cdac`)

---

### Module: `modules/key_pair/`

**Purpose:** Wraps `aws_key_pair` with lifecycle rule to ignore write-only `public_key` changes.

**Inputs (from root `var.key_pairs` map):**
- `key_name` (required) — key pair name
- `public_key` (optional, sensitive, default: `""`) — public key material (write-only; value from `secrets.auto.tfvars`)
- `tags` (optional, map, default: `{}`)

**Outputs:**
- `key_name` — key pair name
- `id` — key pair ID

**Call style:** `for_each` (currently empty map; phantom resource excluded)

**Lifecycle rule:** `ignore_changes = [public_key]` — AWS API does not return `public_key` after creation, so to prevent perpetual drift, this attribute is excluded from comparison.

---

### Module: `modules/network_interface/`

**Purpose:** Wraps `aws_network_interface` for explicit ENI creation.

**Inputs (from root `var.network_interfaces` map):**
- `subnet_id` (required) — VPC subnet
- `private_ips` (optional, list, default: `[]`) — list of private IPs to assign
- `security_groups` (optional, list, default: `[]`) — security group IDs
- `description` (optional, default: `""`)
- `source_dest_check` (optional, default: `true`)
- `tags` (optional, map, default: `{}`)

**Outputs:**
- `id` — ENI ID

**Call style:** `for_each` (key: `eni_0cde3d4209449554a`)

---

## 4. How Import Works

### Initial Import Process

The `imports.sh` script performs one-time import of cloud resources into Terraform state. It was executed once during reconciliation and need not be run again unless state is lost or a resource is deleted and must be re-imported.

**Import command format:**
```bash
terraform import -var-file environments/sg.tfvars '<module-qualified-address>' '<cloud-id>'
```

**Executed imports (from `imports.sh`):**

1. EBS volume:
   ```bash
   terraform import -var-file environments/sg.tfvars \
     'module.ebs_volume["vol_0eee7b20020c3cdac"].aws_ebs_volume.this' \
     'vol-0eee7b20020c3cdac'
   ```

2. Network interface:
   ```bash
   terraform import -var-file environments/sg.tfvars \
     'module.network_interface["eni_0cde3d4209449554a"].aws_network_interface.this' \
     'eni-0cde3d4209449554a'
   ```

3. EC2 instance:
   ```bash
   terraform import -var-file environments/sg.tfvars \
     'module.instance["taher_private_runner_amz"].aws_instance.this' \
     'i-01494deda99ac7624'
   ```

### Re-importing a Single Resource

If state is lost for a specific resource, re-import it using the same command above. For example, to re-import the instance:

```bash
/tmp/tmp.CImMhn/terraform import -var-file environments/sg.tfvars \
  'module.instance["taher_private_runner_amz"].aws_instance.this' \
  'i-01494deda99ac7624'
```

Ensure the corresponding entry exists in `environments/sg.tfvars` and `secrets.auto.tfvars` before re-importing.

### Phantom Resource: Key Pair

The key pair `taher-private-runner` (ID: `key-07b4fecdf3b13a3b9`) was discovered in the inventory but returned `NoSuchEntity` at import time, indicating it was deleted after discovery. It is **excluded** from:
- `imports.sh` (no import line)
- `environments/sg.tfvars` (`key_pairs = {}`)
- Terraform state

The `modules/key_pair/` module exists as a template but remains unused. If the key pair must be managed, add an entry to `var.key_pairs` in the tfvars file.

---

## 5. How to Use the Code

### Prerequisites

1. **Terraform/OpenTofu binary** available at `/tmp/tmp.CImMhn/terraform`
2. **AWS credentials** configured (via environment variables, `~/.aws/credentials`, or IAM role)
3. **Working directory:** `/mnt/sg_workspace/user/global-settings`

### Initialize Terraform

```bash
cd /mnt/sg_workspace/user/global-settings

/tmp/tmp.CImMhn/terraform init
```

This initializes the backend and downloads the AWS provider.

### Plan Changes

To preview changes before applying:

```bash
/tmp/tmp.CImMhn/terraform plan -var-file=environments/sg.tfvars
```

If using a custom secrets file:
```bash
/tmp/tmp.CImMhn/terraform plan \
  -var-file=environments/sg.tfvars \
  -var-file=secrets.auto.tfvars
```

### Apply Configuration

To apply the configuration:

```bash
/tmp/tmp.CImMhn/terraform apply -var-file=environments/sg.tfvars
```

Terraform will prompt for confirmation before applying changes.

### Targeting Another Environment

To deploy the same infrastructure to a different environment (e.g., dev → prod):

1. **Copy the current tfvars file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the new file to change resource values:**
   ```bash
   # Edit environments/prod.tfvars
   # Update AMI IDs, instance types, subnet IDs, security groups, etc.
   vim environments/prod.tfvars
   ```

3. **Plan for the new environment:**
   ```bash
   /tmp/tmp.CImMhn/terraform plan -var-file=environments/prod.tfvars
   ```

4. **Apply to the new environment:**
   ```bash
   /tmp/tmp.CImMhn/terraform apply -var-file=environments/prod.tfvars
   ```

**Important:** No `.tf` files need to be edited. All configuration is driven by the tfvars file.

---

## 6. Variables

### Root-level Variables (from `variables.tf`)

#### `var.instances` (map of objects)

**Type:** `map(object({...}))`

**Description:** Map of EC2 instances to create. Key is the logical name (e.g., `taher_private_runner_amz`).

**Schema:**
```hcl
instances = {
  <key> = {
    ami                    = string       # Required: AMI ID
    instance_type          = string       # Required: e.g., "t2.medium"
    subnet_id              = string       # Required: VPC subnet ID
    vpc_security_group_ids = list(string) # Optional (default: [])
    key_name               = string       # Optional
    availability_zone      = string       # Optional
    tenancy                = string       # Optional (default: "default")
    ebs_optimized          = bool         # Optional (default: false)
    source_dest_check      = bool         # Optional (default: true)
    monitoring             = bool         # Optional (default: false)
    hibernation            = bool         # Optional (default: false)
    enclave_options_enabled = bool        # Optional (default: false)
    root_block_device = {                 # Optional
      volume_type           = string      # Optional
      volume_size           = number      # Optional
      iops                  = number      # Optional
      throughput            = number      # Optional
      delete_on_termination = bool        # Optional (default: true)
      encrypted             = bool        # Optional (default: false)
    }
    metadata_options = {                  # Optional
      http_endpoint               = string # Optional (default: "enabled")
      http_tokens                 = string # Optional (default: "optional")
      http_put_response_hop_limit = number # Optional (default: 1)
      instance_metadata_tags      = string # Optional (default: "disabled")
    }
    cpu_options = {                       # Optional
      core_count       = number           # Optional
      threads_per_core = number           # Optional
    }
    tags = map(string)                    # Optional (default: {})
  }
}
```

**Current value (in `environments/sg.tfvars`):**
```hcl
instances = {
  taher_private_runner_amz = {
    ami                    = "ami-0b74f796d330ab49c"
    instance_type          = "t2.medium"
    subnet_id              = "subnet-072669658da496c4a"
    vpc_security_group_ids = ["sg-092a5ff991a0802bc"]
    key_name               = "taher-private-runner"
    availability_zone      = "eu-central-1a"
    tenancy                = "default"
    ebs_optimized          = false
    source_dest_check      = true
    monitoring             = false
    hibernation            = false
    enclave_options_enabled = false
    root_block_device = {
      volume_type           = "gp3"
      volume_size           = 24
      iops                  = 3000
      throughput            = 125
      delete_on_termination = true
      encrypted             = false
    }
    metadata_options = {
      http_endpoint               = "enabled"
      http_tokens                 = "required"
      http_put_response_hop_limit = 2
      instance_metadata_tags      = "disabled"
    }
    cpu_options = {
      core_count       = 2
      threads_per_core = 1
    }
    tags = {
      Name = "taher-private-runner-amz"
    }
  }
}
```

---

#### `var.ebs_volumes` (map of objects)

**Type:** `map(object({...}))`

**Description:** Map of EBS volumes to create. Key is the logical name (e.g., `vol_0eee7b20020c3cdac`).

**Schema:**
```hcl
ebs_volumes = {
  <key> = {
    availability_zone    = string         # Required: AZ
    size                 = number         # Required: size in GiB
    volume_type          = string         # Optional (default: "gp3")
    iops                 = number         # Optional
    throughput           = number         # Optional: MiB/s (gp3 only)
    encrypted            = bool           # Optional (default: false)
    snapshot_id          = string         # Optional
    multi_attach_enabled = bool           # Optional (default: false)
    tags                 = map(string)    # Optional (default: {})
  }
}
```

**Current value (in `environments/sg.tfvars`):**
```hcl
ebs_volumes = {
  vol_0eee7b20020c3cdac = {
    availability_zone    = "eu-central-1a"
    size                 = 24
    volume_type          = "gp3"
    iops                 = 3000
    throughput           = 125
    encrypted            = false
    snapshot_id          = "snap-06a09a66f5eced5fb"
    multi_attach_enabled = false
    tags                 = {}
  }
}
```

---

#### `var.key_pairs` (map of objects)

**Type:** `map(object({...}))`

**Description:** Map of key pairs. Currently empty due to phantom resource exclusion.

**Schema:**
```hcl
key_pairs = {
  <key> = {
    key_name = string         # Required
    tags     = map(string)    # Optional (default: {})
  }
}
```

**Current value (in `environments/sg.tfvars`):**
```hcl
key_pairs = {}
```

---

#### `var.network_interfaces` (map of objects)

**Type:** `map(object({...}))`

**Description:** Map of network interfaces to create. Key is the logical name.

**Schema:**
```hcl
network_interfaces = {
  <key> = {
    subnet_id         = string         # Required
    private_ips       = list(string)   # Optional (default: [])
    security_groups   = list(string)   # Optional (default: [])
    description       = string         # Optional (default: "")
    source_dest_check = bool           # Optional (default: true)
    tags              = map(string)    # Optional (default: {})
  }
}
```

**Current value (in `environments/sg.tfvars`):**
```hcl
network_interfaces = {
  eni_0cde3d4209449554a = {
    subnet_id         = "subnet-072669658da496c4a"
    private_ips       = ["10.0.0.41"]
    security_groups   = ["sg-092a5ff991a0802bc"]
    description       = ""
    source_dest_check = true
    tags              = {}
  }
}
```

---

#### `var.key_pair_public_key` (sensitive string)

**Type:** `string` (sensitive)

**Description:** Public key material for key pair creation. This is a write-only attribute that AWS does not return after creation. Placeholder value: `"placeholder-import-only"`. 

**Default:** `""` (empty string in `variables.tf`)

**⚠️ Important — Secrets Management:**

This variable is **sensitive** and should **NOT** be stored in `environments/sg.tfvars`. Instead, create a file `secrets.auto.tfvars` in the working directory:

```hcl
# secrets.auto.tfvars
key_pair_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxxxx... user@host"
```

**Do NOT commit `secrets.auto.tfvars` to version control.** Terraform will automatically load any `*.auto.tfvars` files in the working directory.

Alternatively, pass the sensitive variable via the command line:
```bash
/tmp/tmp.CImMhn/terraform plan \
  -var-file=environments/sg.tfvars \
  -var 'key_pair_public_key=ssh-rsa AAAAB3NzaC1...'
```

---

## 7. Infrastructure Graph

The infrastructure dependency graph shows how resources reference each other:

```
module.instance["taher_private_runner_amz"].aws_instance.this
│   (id: i-01494deda99ac7624)
│
├─→ Subnet (vpc_id: vpc-0119b9388f2104572)
│   (subnet_id: subnet-072669658da496c4a)
│
├─→ Security Group
│   (sg_id: sg-092a5ff991a0802bc, name: launch-wizard-4)
│
├─→ Key Pair (key_name: taher-private-runner)
│   ⚠ Phantom — not in state
│
└─→ AMI (ami-0b74f796d330ab49c)


module.ebs_volume["vol_0eee7b20020c3cdac"].aws_ebs_volume.this
│   (id: vol-0eee7b20020c3cdac)
│
└─→ Snapshot (snap-06a09a66f5eced5fb)
│   (restored from)
│
└─→ Attached to Instance
    (i-01494deda99ac7624, mount device: /dev/xvda)


module.network_interface["eni_0cde3d4209449554a"].aws_network_interface.this
│   (id: eni-0cde3d4209449554a)
│
├─→ Subnet (subnet_id: subnet-072669658da496c4a)
│
├─→ Security Group (sg-092a5ff991a0802bc)
│
└─→ Attached to Instance
    (i-01494deda99ac7624, device index: 0, primary)


module.key_pair[].aws_key_pair.this
    (Empty — phantom resource excluded)
```

**References not managed by this stack (pre-existing in AWS):**
- VPC: `vpc-0119b9388f2104572`
- Subnet: `subnet-072669658da496c4a`
- Security Groups: `sg-092a5ff991a0802bc`
- AMI: `ami-0b74f796d330ab49c`
- Snapshots: `snap-06a09a66f5eced5fb`

These are discovered dependencies but are not created or destroyed by this configuration.

---

## 8. Notable Decisions & Caveats

### Lifecycle: Ignore `public_key` Changes

**Decision:** `modules/key_pair/main.tf` includes `lifecycle { ignore_changes = [public_key] }`.

**Reason:** The AWS API does not return `public_key` after key pair creation (it is write-only). Without this ignore rule, Terraform would perpetually detect drift and attempt to update the key pair on every plan/apply cycle, even though the remote state hasn't changed.

**Impact:** The key pair's public key cannot be updated through Terraform. If you need to rotate the key, you must delete and recreate the key pair (manually or by removing the entry from `var.key_pairs` and re-adding it).

---

### Phantom Resource: Key Pair Exclusion

**Discovery:** The key pair `taher-private-runner` (ID: `key-07b4fecdf3b13a3b9`) was discovered in the cloud inventory but returned `NoSuchEntity` at import time, indicating it was deleted between discovery and import.

**Decision:** The key pair is **excluded** from state, `imports.sh`, and `environments/sg.tfvars` (`key_pairs = {}`).

**Impact:** 
- The instance still references the key pair by name (`key_name: "taher-private-runner"`), but Terraform does not manage the key pair resource itself.
- If the key pair is recreated in AWS (manually or via another configuration), it must be managed separately or explicitly added to `var.key_pairs` in this configuration.
- The final plan result shows 0/0/0 changes because the instance is already running and bound to the existing key pair.

---

### Module Outputs: Unused in Root

**Decision:** Root-level `outputs.tf` is intentionally empty.

**Reason:** All four modules export outputs (instance ID/IP, volume ID/ARN, key pair name/ID, ENI ID), but the root configuration does not expose them as root outputs. This avoids stale-null issues when using `for_each` — if a map entry is removed, the output reference would become null and cause drift elsewhere.

**Impact:** To access resource IDs after `apply`, inspect the state file directly:
```bash
/tmp/tmp.CImMhn/terraform state show 'module.instance["taher_private_runner_amz"].aws_instance.this'
```

---

### Computed Attributes: Not Managed

The following computed/read-only attributes from AWS are **not** defined in the Terraform schema and thus are not managed:

- **Instance:**
  - `arn`, `launch_time`, `private_dns_name`, `public_dns_name`, `vpc_id`, `primary_network_interface_id`, etc.
  - IMDSv2 state appliance (computed after creation)
  - Block device attachment metadata

- **EBS Volume:**
  - `arn`, `create_time`, `state`, `attachments` (populated by AWS after attachment)

- **Network Interface:**
  - `arn`, `mac_address`, `owner_id`, `attachment_*` (populated by AWS)

These are captured in state but not re-validated or modified by Terraform, allowing AWS-side changes to coexist without causing drift errors.

---

### State Backend: Local (Default)

**Decision:** No backend configuration specified in `versions.tf` (using local state).

**State file location:** `.terraform/tfstate` (by default) or the current working directory.

**Consideration:** For production workloads, configure a remote backend (S3, Terraform Cloud, etc.) to enable team collaboration and state locking.

---

### Region Lock: eu-central-1

**Decision:** AWS provider is hard-coded to `eu-central-1` in `providers.tf`.

**Impact:** All resources are deployed in this region. To deploy to a different region, either:
1. Edit `providers.tf` to change the region, or
2. Override via environment variable: `export AWS_REGION=us-east-1` (if not hard-coded in code)

---

### Sensitive Variable: key_pair_public_key

**Sensitive:** `yes`

**Handling:** 
- Not stored in `environments/sg.tfvars`
- Must be provided via `secrets.auto.tfvars` (gitignored) or `-var` flag
- Current placeholder: `"placeholder-import-only"` in root `variables.tf`
- If the key pair is recreated, update this value with the actual public key

---

### Attribute Defaults Applied by Modules

The module schema uses `optional()` with defaults for most parameters. These defaults are applied at variable declaration time and ensure that omitted entries in the tfvars maps do not cause errors:

| Variable | Default | Module |
|----------|---------|--------|
| `vpc_security_group_ids` | `[]` | instance |
| `tenancy` | `"default"` | instance |
| `ebs_optimized` | `false` | instance |
| `source_dest_check` | `true` | instance |
| `monitoring` | `false` | instance |
| `hibernation` | `false` | instance |
| `enclave_options_enabled` | `false` | instance |
| `root_block_device` | `null` (not configured) | instance |
| `metadata_options` | `null` (not configured) | instance |
| `cpu_options` | `null` (not configured) | instance |
| `tags` | `{}` | all modules |
| `volume_type` | `"gp3"` | ebs_volume |
| `iops` | `null` | ebs_volume |
| `throughput` | `null` | ebs_volume |
| `encrypted` | `false` | ebs_volume |
| `snapshot_id` | `null` | ebs_volume |
| `multi_attach_enabled` | `false` | ebs_volume |
| `private_ips` | `[]` | network_interface |
| `security_groups` | `[]` | network_interface |
| `description` | `""` | network_interface |

Modifying any of these in the tfvars file will cause Terraform to detect a change and apply it on the next `plan`/`apply` cycle.

---

### No Data Sources

The configuration does not include data sources to look up VPCs, subnets, security groups, or AMIs. All IDs are hardcoded in the tfvars file. To change the deployment target, edit these IDs directly in `environments/sg.tfvars` or create a new tfvars file for a different environment.

---

## Summary

This infrastructure stack manages a minimal but complete EC2 deployment:
- **1 instance** with explicit CPU options and IMDSv2 hardening
- **1 EBS volume** with snapshot restore
- **1 network interface** with a fixed private IP
- Modules organized for reusability and clarity

All resources are imported into state, reconciled to 0 changes, and ready for incremental modifications via the tfvars files. Sensitive secrets (key material) must be provided separately before planning.
