# Infrastructure Documentation

## 1. Overview

This Terraform/OpenTofu codebase manages AWS EC2 infrastructure in the `eu-central-1` region. The infrastructure was discovered from an existing AWS account, code was generated, resources were imported into state via `imports.sh`, and final reconciliation showed zero changes (0 to add, 0 to change, 0 to destroy), confirming all discovered resources are now properly managed by this configuration.

**What is managed:**
- One EC2 instance (`taher-private-runner-ubuntu`) in a stopped state
- One EBS volume (gp3, 32 GB) with custom IOPS and throughput
- One network interface attached to the instance
- One SSH key pair for instance access

All resources are provisioned in `eu-central-1a` and are configured using modular Terraform code with reusable modules for each resource type.

---

## 2. Resources

| Terraform Address | Resource Type | AWS Name/ID | Purpose |
|---|---|---|---|
| `module.key_pair["taher_private_runner"].aws_key_pair.this` | `aws_key_pair` | taher-private-runner | SSH public key pair for EC2 instance authentication |
| `module.ebs_volume["vol_072212cd519ee269f"].aws_ebs_volume.this` | `aws_ebs_volume` | vol-072212cd519ee269f | 32 GB gp3 root volume for the instance, restored from snapshot |
| `module.network_interface["eni_0ad57450ced1dd2d6"].aws_network_interface.this` | `aws_network_interface` | eni-0ad57450ced1dd2d6 | Primary network interface assigned to instance, IP 10.0.0.52 in private subnet |
| `module.instance["taher_private_runner_ubuntu"].aws_instance.this` | `aws_instance` | i-0a0ca27d00e7e74b9 | t2.medium EC2 instance, Ubuntu AMI (ami-03250b0e01c28d196), currently stopped |

---

## 3. Module Structure

### Root Module (`/mnt/sg_workspace/user/sgcode`)

**Files:**
- `main.tf` — Four `for_each` module calls:
  - `module.key_pair` iterates over `var.key_pairs` map
  - `module.ebs_volume` iterates over `var.ebs_volumes` map
  - `module.network_interface` iterates over `var.network_interfaces` map
  - `module.instance` iterates over `var.instances` map
- `variables.tf` — Root-level variable definitions for all four map inputs
- `outputs.tf` — No root-level outputs (designed to avoid stale-null trap)
- `versions.tf` — Provider version constraint (Hashicorp AWS provider, no pinned version)
- `providers.tf` — AWS provider configured for `eu-central-1` region

**Call pattern:** Each module uses `for_each = var.{resource_type}` to support multiple instances of each resource type.

### Module: `modules/key_pair`

**Purpose:** Manages AWS SSH key pairs.

**Files:**
- `main.tf` — Defines `aws_key_pair.this` with `lifecycle { ignore_changes = [public_key] }`
- `variables.tf` — Inputs: `key_name` (required), `public_key` (optional, defaults to "placeholder"), `tags` (optional)
- `outputs.tf` — Output: `key_name`

**Note:** `public_key` is write-only (AWS API never returns it after creation). A placeholder value with `ignore_changes` prevents perpetual drift.

### Module: `modules/ebs_volume`

**Purpose:** Manages AWS EBS volumes.

**Files:**
- `main.tf` — Defines `aws_ebs_volume.this`
- `variables.tf` — Inputs: `availability_zone` (required), `size` (required), `type`, `iops`, `throughput`, `encrypted`, `multi_attach_enabled`, `snapshot_id`, `tags`
- `outputs.tf` — Outputs: `id`, `arn`

### Module: `modules/network_interface`

**Purpose:** Manages AWS EC2 network interfaces.

**Files:**
- `main.tf` — Defines `aws_network_interface.this`
- `variables.tf` — Inputs: `subnet_id` (required), `private_ips`, `security_groups`, `source_dest_check`, `description`, `tags`
- `outputs.tf` — Output: `id`

### Module: `modules/instance`

**Purpose:** Manages AWS EC2 instances with comprehensive configuration.

**Files:**
- `main.tf` — Defines `aws_instance.this` with:
  - Basic instance configuration (AMI, type, key, subnet, security groups)
  - `root_block_device` configuration (volume type, size, IOPS, throughput, encryption, delete-on-termination)
  - `metadata_options` configuration (IMDSv2 settings, IPv6 protocol, instance metadata tags)
- `variables.tf` — 25 input variables covering instance and metadata options with sensible defaults
- `outputs.tf` — Outputs: `id`, `arn`, `private_ip`

---

## 4. How Import Works

The `imports.sh` script contains four Terraform `import` commands that map each discovered resource to its Terraform address and AWS resource ID:

```bash
terraform import -var-file environments/sg.tfvars 'module.key_pair["taher_private_runner"].aws_key_pair.this' 'taher-private-runner'
terraform import -var-file environments/sg.tfvars 'module.ebs_volume["vol_072212cd519ee269f"].aws_ebs_volume.this' 'vol-072212cd519ee269f'
terraform import -var-file environments/sg.tfvars 'module.network_interface["eni_0ad57450ced1dd2d6"].aws_network_interface.this' 'eni-0ad57450ced1dd2d6'
terraform import -var-file environments/sg.tfvars 'module.instance["taher_private_runner_ubuntu"].aws_instance.this' 'i-0a0ca27d00e7e74b9'
```

**How it works:**
1. Each `import` command accepts:
   - The Terraform module-qualified address (e.g., `module.key_pair["taher_private_runner"].aws_key_pair.this`)
   - The AWS resource identifier (key name for key pairs, resource ID for others)
2. The script was executed once during initial setup, populating the Terraform state with discovered resources.
3. Import does not need to be re-run unless state is lost or a resource is removed from state manually.

**To re-import a single resource** (if state is corrupted or lost):
```bash
# Example: re-import the key pair
terraform import -var-file environments/sg.tfvars 'module.key_pair["taher_private_runner"].aws_key_pair.this' 'taher-private-runner'
```

**Note on AWS import IDs:**
- **Key pairs:** Use the **key name** (`taher-private-runner`), not the key pair ID (`key-07b4fecdf3b13a3b9`)
- **EBS volumes, network interfaces, instances:** Use the AWS resource ID directly

---

## 5. How to Use the Code

### Prerequisites
- Terraform/OpenTofu installed
- AWS credentials configured (via `~/.aws/credentials`, environment variables, or IAM role)
- Working directory: `/mnt/sg_workspace/user/sgcode`

### Initialize Terraform

```bash
terraform init
```

This downloads the AWS provider and initializes the local backend (state stored in `.terraform/` directory by default).

### Plan Changes

To see what Terraform will do (with current environment values):

```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output after initial import: `No changes. Your infrastructure matches the configuration.`

### Apply Changes

To apply planned changes:

```bash
terraform apply -var-file=environments/sg.tfvars
```

You will be prompted to confirm before any modifications are made.

### Using a Different Environment

To target a different environment (e.g., moving from staging to production):

1. **Copy the environment file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit variable values** in the new file:
   ```bash
   # Edit environments/prod.tfvars with production-specific values:
   # - Change instance types, availability zones, AMI IDs, key names, subnet/security group IDs, etc.
   ```

3. **Plan against the new environment:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   ```

4. **Apply against the new environment:**
   ```bash
   terraform apply -var-file=environments/prod.tfvars
   ```

**No Terraform code changes required** — all infrastructure variation is managed via `tfvars` files.

### Common Terraform Commands

```bash
# Validate syntax
terraform validate

# Format code
terraform fmt -recursive

# Show current state
terraform show

# List all resources in state
terraform state list

# Show details of a specific resource
terraform state show 'module.instance["taher_private_runner_ubuntu"].aws_instance.this'

# Destroy all infrastructure (requires confirmation)
terraform destroy -var-file=environments/sg.tfvars
```

---

## 6. Variables

### Root-Level Input Variables

All variables are defined in `variables.tf` and configured via `environments/sg.tfvars`.

#### `key_pairs` (map of objects)
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Purpose:** Defines SSH key pairs to create or manage
- **Fields per key pair:**
  - `key_name` (string, required): AWS key pair name
  - `public_key` (string, optional): Public key content; defaults to `"placeholder"` (see caveats)
  - `tags` (map of strings, optional): Resource tags

#### `ebs_volumes` (map of objects)
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Purpose:** Defines EBS volumes to create or manage
- **Fields per volume:**
  - `availability_zone` (string, required): AWS AZ (e.g., `eu-central-1a`)
  - `size` (number, required): Volume size in GiB
  - `type` (string, optional): Volume type; defaults to `gp2`
  - `iops` (number, optional): IOPS for gp3/io1/io2; defaults to `null`
  - `throughput` (number, optional): Throughput in MB/s for gp3; defaults to `null`
  - `encrypted` (bool, optional): Enable encryption; defaults to `false`
  - `multi_attach_enabled` (bool, optional): Allow multiple attachments; defaults to `false`
  - `snapshot_id` (string, optional): Snapshot to restore from; defaults to `null`
  - `tags` (map of strings, optional): Resource tags

#### `network_interfaces` (map of objects)
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Purpose:** Defines ENI (network interface) resources
- **Fields per interface:**
  - `subnet_id` (string, required): Subnet ID for attachment
  - `private_ips` (list of strings, optional): Private IP addresses; defaults to `[]`
  - `security_groups` (list of strings, optional): Security group IDs; defaults to `[]`
  - `source_dest_check` (bool, optional): Enable source/destination check; defaults to `true`
  - `description` (string, optional): Interface description; defaults to `""`
  - `tags` (map of strings, optional): Resource tags

#### `instances` (map of objects)
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Purpose:** Defines EC2 instances
- **Fields per instance:**
  - `ami` (string, required): AMI ID to launch
  - `instance_type` (string, required): Instance type (e.g., `t2.medium`)
  - `key_name` (string, optional): SSH key pair name; defaults to `null`
  - `subnet_id` (string, optional): Subnet for launch; defaults to `null`
  - `vpc_security_group_ids` (list of strings, optional): Security group IDs; defaults to `[]`
  - `source_dest_check` (bool, optional): Enable source/destination check; defaults to `true`
  - `ebs_optimized` (bool, optional): Enable EBS optimization; defaults to `false`
  - Root volume configuration:
    - `root_volume_type` (string, optional): Volume type; defaults to `gp2`
    - `root_volume_size` (number, optional): Size in GiB; defaults to `8`
    - `root_volume_iops` (number, optional): IOPS; defaults to `null`
    - `root_volume_throughput` (number, optional): Throughput MB/s; defaults to `null`
    - `root_volume_delete_on_termination` (bool, optional): Delete on instance termination; defaults to `true`
    - `root_volume_encrypted` (bool, optional): Enable encryption; defaults to `false`
  - Metadata/IMDSv2 configuration:
    - `metadata_http_endpoint` (string, optional): Defaults to `enabled`
    - `metadata_http_tokens` (string, optional): Defaults to `optional`
    - `metadata_http_put_response_hop_limit` (number, optional): Defaults to `1`
    - `metadata_http_protocol_ipv6` (string, optional): Defaults to `disabled`
    - `metadata_instance_metadata_tags` (string, optional): Defaults to `disabled`
  - `tags` (map of strings, optional): Resource tags

### Current Values (from `environments/sg.tfvars`)

```hcl
key_pairs = {
  taher_private_runner = {
    key_name = "taher-private-runner"
  }
}

ebs_volumes = {
  vol_072212cd519ee269f = {
    availability_zone    = "eu-central-1a"
    size                 = 32
    type                 = "gp3"
    iops                 = 3000
    throughput           = 125
    encrypted            = false
    multi_attach_enabled = false
    snapshot_id          = "snap-0a07d122afed3f01c"
  }
}

network_interfaces = {
  eni_0ad57450ced1dd2d6 = {
    subnet_id         = "subnet-072669658da496c4a"
    private_ips       = ["10.0.0.52"]
    security_groups   = ["sg-092a5ff991a0802bc"]
    source_dest_check = true
    description       = ""
  }
}

instances = {
  taher_private_runner_ubuntu = {
    ami                    = "ami-03250b0e01c28d196"
    instance_type          = "t2.medium"
    key_name               = "taher-private-runner"
    subnet_id              = "subnet-072669658da496c4a"
    vpc_security_group_ids = ["sg-092a5ff991a0802bc"]
    source_dest_check      = true
    ebs_optimized          = false
    root_volume_type       = "gp3"
    root_volume_size       = 32
    root_volume_iops       = 3000
    root_volume_throughput = 125
    root_volume_delete_on_termination = true
    root_volume_encrypted  = false
    metadata_http_endpoint = "enabled"
    metadata_http_tokens   = "required"
    metadata_http_put_response_hop_limit = 2
    metadata_http_protocol_ipv6 = "disabled"
    metadata_instance_metadata_tags = "disabled"
    tags = {
      Name = "taher-private-runner-ubuntu"
    }
  }
}
```

### Sensitive Variables

**No sensitive variables were identified** in this discovery. `secrets.auto.tfvars` was not created.

All variables have their values in `environments/sg.tfvars`. If you need to store sensitive information (e.g., AMI IDs, key names if they contain secrets), you can:
- Create a `secrets.auto.tfvars` file (auto-loaded by Terraform, use `.gitignore` to exclude it)
- Pass variables via `-var` CLI flags: `terraform plan -var-file=environments/sg.tfvars -var 'key_pairs=...'`
- Use environment variables: `TF_VAR_key_pairs='...'`

---

## 7. Infrastructure Graph

```
Root Module (main.tf)
│
├── module.key_pair["taher_private_runner"]
│   └── aws_key_pair.this [taher-private-runner]
│       └── [referenced by: module.instance["taher_private_runner_ubuntu"]]
│
├── module.ebs_volume["vol_072212cd519ee269f"]
│   └── aws_ebs_volume.this [vol-072212cd519ee269f]
│       └── (restored from snapshot: snap-0a07d122afed3f01c)
│       └── [attached to: module.instance["taher_private_runner_ubuntu"]]
│
├── module.network_interface["eni_0ad57450ced1dd2d6"]
│   └── aws_network_interface.this [eni-0ad57450ced1dd2d6]
│       ├── subnet_id: subnet-072669658da496c4a
│       ├── security_groups: [sg-092a5ff991a0802bc]
│       └── [attached to: module.instance["taher_private_runner_ubuntu"]]
│
└── module.instance["taher_private_runner_ubuntu"]
    └── aws_instance.this [i-0a0ca27d00e7e74b9]
        ├── ami: ami-03250b0e01c28d196 (Ubuntu)
        ├── instance_type: t2.medium
        ├── key_name: taher-private-runner [→ aws_key_pair.this]
        ├── subnet_id: subnet-072669658da496c4a
        ├── vpc_security_group_ids: [sg-092a5ff991a0802bc]
        ├── root_block_device [→ aws_ebs_volume.this via snapshot]
        ├── metadata_options: [IMDSv2 enabled with hop limit 2]
        └── tags: { Name = "taher-private-runner-ubuntu" }

External Dependencies (not managed by this code):
├── aws_vpc: vpc-0119b9388f2104572
├── aws_subnet: subnet-072669658da496c4a (in vpc-0119b9388f2104572, az eu-central-1a)
├── aws_security_group: sg-092a5ff991a0802bc
├── aws_ebs_snapshot: snap-0a07d122afed3f01c
└── aws_ami: ami-03250b0e01c28d196 (Ubuntu)
```

---

## 8. Notable Decisions & Caveats

### 1. **Public Key Handling (`aws_key_pair`)**

**Decision:** The `public_key` attribute in `aws_key_pair` is marked write-only by AWS — the API accepts it at creation but never returns it in subsequent reads.

**Implementation:**
- Variable `public_key` defaults to `"placeholder"` (see `modules/key_pair/variables.tf`, line 8)
- `lifecycle { ignore_changes = [public_key] }` applied in `modules/key_pair/main.tf` (line 7-9)
- This prevents perpetual drift when Terraform detects the missing value

**Implication:** To set or update the actual public key, you must either:
- Pass the real public key value via `-var` or `tfvars` before the first apply
- Remove the key pair from state and re-import with the correct value
- Manually update it in the AWS console (Terraform will ignore the change)

### 2. **EBS Volume from Snapshot**

The `ebs_volume` is restored from snapshot `snap-0a07d122afed3f01c`. The volume ID, size, IOPS, and throughput are set to match the discovered state. No changes are expected unless the snapshot or volume properties change.

### 3. **Instance State: Stopped**

The EC2 instance `i-0a0ca27d00e7e74b9` is currently in a **stopped** state (not terminated). Terraform does not manage instance state (running/stopped). To start the instance, use the AWS console or CLI:

```bash
aws ec2 start-instances --instance-ids i-0a0ca27d00e7e74b9 --region eu-central-1
```

Terraform will not attempt to change it; the instance state is not tracked in the code.

### 4. **Network Interface Attachment**

The network interface (`eni-0ad57450ced1dd2d6`) is already attached to the instance via the instance's primary `network_interface_id`. The `modules/network_interface` module manages the ENI itself, but attachment to the instance is handled by the `aws_instance` resource (which uses the `subnet_id` to create the primary ENI internally). If you need to attach additional ENIs, create separate modules and reference them via `network_interface_ids` in the instance module.

### 5. **Unmanaged Dependencies**

The following AWS resources are **referenced but not managed** by this code:
- **VPC** (`vpc-0119b9388f2104572`)
- **Subnet** (`subnet-072669658da496c4a`)
- **Security Group** (`sg-092a5ff991a0802bc`)
- **AMI** (`ami-03250b0e01c28d196`)
- **EBS Snapshot** (`snap-0a07d122afed3f01c`)

These resources must exist in AWS before applying this configuration. To make them managed, add Terraform resources or data sources for them in the root module or a dedicated networking module.

### 6. **IMDSv2 Configuration**

The instance is configured with **IMDSv2 enforced**:
- `metadata_http_tokens = "required"` — enforces session tokens (IMDSv2)
- `metadata_http_put_response_hop_limit = 2` — allows requests from containers/VMs within the instance
- `metadata_http_protocol_ipv6 = "disabled"` — IPv6 metadata is disabled
- `metadata_instance_metadata_tags = "disabled"` — instance tags are not accessible via metadata

This is a security best practice. If you need to relax these settings, update `environments/sg.tfvars`.

### 7. **Module for_each Keys**

Each module uses a map key in its `for_each` block:
- Key pair: `taher_private_runner` (map key, not the actual key name)
- EBS volume: `vol_072212cd519ee269f` (map key, not the volume ID)
- Network interface: `eni_0ad57450ced1dd2d6` (map key, not the ENI ID)
- Instance: `taher_private_runner_ubuntu` (map key, not the instance ID)

**Why:** The map keys serve as local addresses in Terraform state. You can change the map key (and the resource will be destroyed and recreated), but it's safer to keep them stable and only change the values (actual AWS resource identifiers).

### 8. **No Computed Attribute Management**

The following computed attributes are **not managed** in the configuration (they are read-only in state):
- Instance: `public_ip_address`, `primary_network_interface_id`, `launch_time`, `availability_zone`, `platform_details`, `virtualization_type`, `hypervisor`, `cpu_core_count`, `cpu_threads_per_core`, `monitoring_state`, `instance_state`, etc.
- EBS volume: `create_time`, `state`, `arn`, `owner_id`, etc.
- Network interface: `private_dns_name`, `mac_address`, `owner_id`, `status`, etc.

These are captured in state after import and are read-only. They will not cause drift if the real resource changes.

### 9. **Reconciliation Result**

After import and configuration, `terraform plan` returned:
```
No changes. Your infrastructure matches the configuration.
Plan: 0 to add, 0 to change, 0 to destroy.
```

This confirms all discovered resources have been successfully imported and their state matches the configuration.

### 10. **State Backend**

By default, Terraform state is stored in `.terraform/terraform.tfstate` (local backend). For team environments, migrate to a remote backend (S3, Terraform Cloud, etc.) by updating `terraform.tf` or using `terraform init -backend-config=...`.
