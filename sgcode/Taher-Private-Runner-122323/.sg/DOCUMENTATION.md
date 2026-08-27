# Infrastructure Documentation — global-settings

**Last Updated:** 2026-08-27  
**Status:** Reconciled (0 add, 0 change, 0 destroy)  
**Provider:** AWS (Terraform ~> 5.0)  
**Region:** eu-central-1

---

## 1. Overview

This Terraform/OpenTofu module codifies EC2 infrastructure deployed in AWS eu-central-1. The code was generated from discovered cloud resources and reconciled: all discovered resources were imported into Terraform state, configuration was written to match them exactly, and `terraform plan` confirmed no changes are pending.

**Discovered & Codified Resources:**
- 1 EC2 instance (`taher-private-runner-amz`)
- 1 EBS volume (`vol-0eee7b20020c3cdac`)
- 1 network interface (`eni-0cde3d4209449554a`)
- 1 key pair reference (`taher-private-runner`, flagged as phantom/unmanaged)

**What Was Done:**
1. Scanned AWS account (790543352839) and discovered the above resources
2. Generated modular Terraform code with 4 reusable modules (instance, ebs_volume, key_pair, network_interface)
3. Ran `imports.sh` to import each resource into Terraform state
4. Populated `environments/sg.tfvars` with real resource attributes from discovered data
5. Reconciled code to match discovered state; plan showed 0/0/0
6. Key pair `taher-private-runner` (key-07b4fecdf3b13a3b9) was initially discovered but returned "Cannot import non-existent remote object" during import, so it is excluded from managed code and marked as unmanaged

---

## 2. Resources

All resources are instantiated via `for_each` modules defined in `main.tf`. The table below lists every managed resource:

| Terraform Address | Type | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.instance["taher_private_runner_amz"].aws_instance.this` | `aws_instance` | `i-01494deda99ac7624` | EC2 compute instance for private runner workload |
| `module.ebs_volume["vol_0eee7b20020c3cdac"].aws_ebs_volume.this` | `aws_ebs_volume` | `vol-0eee7b20020c3cdac` | Root volume (24 GiB gp3) for the instance, created from snapshot |
| `module.network_interface["eni_0cde3d4209449554a"].aws_network_interface.this` | `aws_network_interface` | `eni-0cde3d4209449554a` | Primary network interface attached to the instance |

**Unmanaged Resource:**
- `aws_key_pair` `taher-private-runner` (key-07b4fecdf3b13a3b9) — phantom resource (no longer exists in AWS); import failed; excluded from state and `sg.tfvars`

---

## 3. Module Structure

All infrastructure is defined via four reusable local modules under `modules/`:

### `modules/instance`
**Purpose:** Manages EC2 instances.  
**Resource:** `aws_instance.this`  
**Key Variables:**
- `ami_id` — AMI to launch (required)
- `instance_type` — EC2 type e.g. `t2.medium` (required)
- `key_name` — Key pair for SSH access (required)
- `subnet_id` — VPC subnet (required)
- `vpc_security_group_ids` — Security group list (required)
- `availability_zone` — Availability zone (required)
- `associate_public_ip_address` — Public IP flag (default: false)
- `source_dest_check` — Source/dest check (default: true)
- `ebs_optimized` — EBS optimization flag (default: false)
- `monitoring` — CloudWatch detailed monitoring (default: false)
- `root_block_device` — Root volume config (optional object with volume_type, volume_size, encrypted, delete_on_termination)
- `metadata_options` — IMDSv2 settings (optional object with http_endpoint, http_tokens, http_put_response_hop_limit, instance_metadata_tags)
- `tags` — EC2 tags (default: {})

**Outputs:** `id`, `arn`, `private_ip`

**Lifecycle:** Ignores changes to `user_data` and `user_data_base64` (write-only fields not returned by AWS API).

### `modules/ebs_volume`
**Purpose:** Manages EBS volumes.  
**Resource:** `aws_ebs_volume.this`  
**Key Variables:**
- `availability_zone` — AZ for the volume (required)
- `size` — Volume size in GiB (required)
- `type` — Volume type e.g. `gp3` (default: gp2)
- `iops` — IOPS provisioned (default: null)
- `throughput` — Throughput in MiB/s (default: null)
- `encrypted` — Encryption flag (default: false)
- `snapshot_id` — Snapshot ID to restore from (default: null)
- `multi_attach_enabled` — Multi-attach flag (default: false)
- `tags` — Volume tags (default: {})

**Outputs:** `id`, `arn`

**Lifecycle:** None (standard).

### `modules/key_pair`
**Purpose:** Manages EC2 key pairs.  
**Resource:** `aws_key_pair.this`  
**Key Variables:**
- `key_name` — Key name (required)
- `public_key` — Public key material (default: ""; write-only, not returned by AWS API)
- `tags` — Key pair tags (default: {})

**Outputs:** `id`, `key_pair_id`

**Lifecycle:** Ignores changes to `public_key` (write-only field; prevents drift after import).

### `modules/network_interface`
**Purpose:** Manages ENIs.  
**Resource:** `aws_network_interface.this`  
**Key Variables:**
- `subnet_id` — Subnet ID (required)
- `private_ips` — List of private IPs (default: [])
- `security_groups` — List of security group IDs (default: [])
- `description` — Interface description (default: "")
- `source_dest_check` — Source/dest check (default: true)
- `tags` — Interface tags (default: {})

**Outputs:** `id`, `arn`

**Lifecycle:** None (standard).

---

## 4. How Import Works

**Background:**
The file `imports.sh` contains shell commands that execute Terraform `import` to populate state with real AWS resources. Each line maps a Terraform module-qualified address (e.g., `module.instance["taher_private_runner_amz"].aws_instance.this`) to its AWS resource ID (e.g., `i-01494deda99ac7624`).

**Import Script Contents** (`imports.sh`):
```sh
#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.instance["taher_private_runner_amz"].aws_instance.this' 'i-01494deda99ac7624'
"$1" import -var-file environments/sg.tfvars 'module.ebs_volume["vol_0eee7b20020c3cdac"].aws_ebs_volume.this' 'vol-0eee7b20020c3cdac'
# key_pair taher-private-runner (key-07b4fecdf3b13a3b9) is a phantom — removed from cloud, excluded
"$1" import -var-file environments/sg.tfvars 'module.network_interface["eni_0cde3d4209449554a"].aws_network_interface.this' 'eni-0cde3d4209449554a'
```

**How to Use:**
1. Run once during initial setup: `sh imports.sh /path/to/terraform`
2. This command was already executed to populate the current state; no re-run is needed unless state is deleted.

**To Re-import a Single Resource** (if state is lost):
```bash
terraform init
terraform import -var-file=environments/sg.tfvars 'module.instance["taher_private_runner_amz"].aws_instance.this' 'i-01494deda99ac7624'
```

**Important:** `imports.sh` passes the Terraform binary as `$1` so it works with both `terraform` and `tofu`. Always run within an initialized Terraform working directory with backend configured.

---

## 5. How to Use the Code

### Initialization
```bash
terraform init
```
This initializes the working directory, downloads provider plugins (AWS ~> 5.0), and sets up the backend (local state by default).

### Planning
To preview changes against the current environment (`sg`):
```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output (after reconciliation): **No changes. 0 to add, 0 to change, 0 to destroy.**

### Applying
To apply changes:
```bash
terraform apply -var-file=environments/sg.tfvars
```

### Switching to Another Environment
To deploy to a different environment (e.g., `dev` or `prod`), create a new `.tfvars` file and use it:

1. **Create a new environment file:**
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   # Edit environments/dev.tfvars to change resource IDs, IPs, AMIs, etc.
   ```

2. **Plan for the new environment:**
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   ```

3. **Apply:**
   ```bash
   terraform apply -var-file=environments/dev.tfvars
   ```

**Note:** No `.tf` files need editing; environment-specific values live only in `.tfvars` files.

### Targeting a Specific Resource
To apply changes to one resource only:
```bash
terraform apply -var-file=environments/sg.tfvars -target='module.instance["taher_private_runner_amz"]'
```

---

## 6. Variables

### Root-Level Variables (defined in `variables.tf`)

#### `instances`
**Type:** `map(object(...))`  
**Default:** `{}`  
**Description:** Map of EC2 instances keyed by logical name (e.g., `taher_private_runner_amz`).  
**Current Value** (from `sg.tfvars`):
```hcl
instances = {
  taher_private_runner_amz = {
    ami_id                 = "ami-0b74f796d330ab49c"
    instance_type          = "t2.medium"
    key_name               = "taher-private-runner"
    subnet_id              = "subnet-072669658da496c4a"
    vpc_security_group_ids = ["sg-092a5ff991a0802bc"]
    availability_zone      = "eu-central-1a"
    associate_public_ip_address = false
    source_dest_check      = true
    ebs_optimized          = false
    monitoring             = false
    root_block_device = {
      volume_type           = "gp3"
      volume_size           = 24
      delete_on_termination = true
      encrypted             = false
    }
    metadata_options = {
      http_endpoint               = "enabled"
      http_tokens                 = "required"
      http_put_response_hop_limit = 2
      instance_metadata_tags      = "disabled"
    }
    tags = {
      Name = "taher-private-runner-amz"
    }
  }
}
```

#### `ebs_volumes`
**Type:** `map(object(...))`  
**Default:** `{}`  
**Description:** Map of EBS volumes keyed by logical name (e.g., `vol_0eee7b20020c3cdac`).  
**Current Value** (from `sg.tfvars`):
```hcl
ebs_volumes = {
  vol_0eee7b20020c3cdac = {
    availability_zone    = "eu-central-1a"
    size                 = 24
    type                 = "gp3"
    iops                 = 3000
    throughput           = 125
    encrypted            = false
    snapshot_id          = "snap-06a09a66f5eced5fb"
    multi_attach_enabled = false
  }
}
```

#### `key_pairs`
**Type:** `map(object(...))`  
**Default:** `{}`  
**Description:** Map of key pairs keyed by logical name.  
**Current Value** (from `sg.tfvars`):
```hcl
key_pairs = {}
```
**Note:** This is empty because the key pair `taher-private-runner` is unmanaged (phantom resource excluded during import).

#### `network_interfaces`
**Type:** `map(object(...))`  
**Default:** `{}`  
**Description:** Map of network interfaces keyed by logical name (e.g., `eni_0cde3d4209449554a`).  
**Current Value** (from `sg.tfvars`):
```hcl
network_interfaces = {
  eni_0cde3d4209449554a = {
    subnet_id         = "subnet-072669658da496c4a"
    private_ips       = ["10.0.0.41"]
    security_groups   = ["sg-092a5ff991a0802bc"]
    description       = ""
    source_dest_check = true
  }
}
```

### Sensitive Variables

**No sensitive variables are used in this code.** All values in `environments/sg.tfvars` are infrastructure identifiers and configuration settings, not credentials. There is no `secrets.auto.tfvars` file with real secrets in the shipped code.

---

## 7. Infrastructure Graph

```
Instance (EC2 Compute)
│
├── (ami_id) ──→ AMI ami-0b74f796d330ab49c [external reference]
│
├── (key_name) ──→ Key Pair taher-private-runner [unmanaged]
│
├── (subnet_id) ──→ Subnet subnet-072669658da496c4a [external reference]
│
├── (vpc_security_group_ids) ──→ Security Group sg-092a5ff991a0802bc [external reference]
│
├── (root_block_device: volume_type=gp3, volume_size=24)
│   └── [managed inline, not a separate aws_ebs_volume]
│
└── Network Interface (ENI) eni-0cde3d4209449554a [managed]
    ├── (subnet_id) ──→ Subnet subnet-072669658da496c4a [shared]
    ├── (security_groups) ──→ Security Group sg-092a5ff991a0802bc [shared]
    └── (private_ips) = ["10.0.0.41"]

EBS Volume (standalone)
│
├── vol-0eee7b20020c3cdac
│   ├── type: gp3
│   ├── size: 24 GiB
│   ├── iops: 3000
│   ├── throughput: 125 MiB/s
│   ├── snapshot_id: snap-06a09a66f5eced5fb [external reference]
│   └── [NOT attached to any instance in code; attachment managed by cloud]
│
└── Availability Zone: eu-central-1a
```

**Key Points:**
- The **instance** is the central resource; its root block device is managed inline (not as a separate `aws_ebs_volume`).
- The **standalone EBS volume** (`vol-0eee7b20020c3cdac`) is a separate managed resource; it was discovered as attached to the instance in AWS but is not explicitly attached in Terraform code (attachment state is ignored).
- The **network interface** is managed separately for explicit control over private IPs and security groups.
- References to **subnet, security group, AMI, and snapshot** are external resources not managed by this code; they are identified by their AWS IDs.

---

## 8. Notable Decisions & Caveats

### Lifecycle: `ignore_changes` Decisions

1. **`modules/instance/main.tf`**: `ignore_changes = [user_data, user_data_base64]`
   - **Reason:** `user_data` is not returned by the AWS API after instance creation. Without this, Terraform would report drift if user_data changes in the actual instance or if it is not explicitly set in configuration.
   - **Impact:** You cannot drift-detect user_data changes; they are silently accepted. To update user_data, manually modify the instance or use a separate automation process.

2. **`modules/key_pair/main.tf`**: `ignore_changes = [public_key]`
   - **Reason:** `public_key` is write-only; AWS does not return it after import. Without this, Terraform would show drift immediately after importing the key pair.
   - **Impact:** The public_key is set to an empty string placeholder in the module variable. If you need to manage the public key value, you must update it outside Terraform or replace the key pair.

### Computed/Omitted Attributes

- **Instance metadata returned by AWS** (e.g., `public_ip_address`, `state_transition_time`) are computed and not declared in configuration. They appear in state but are not managed.
- **EBS volume attachments** are managed by AWS (attached to the instance via its root block device). The separate `aws_ebs_volume` resource does not declare attachment; attachment state lives only in the instance's block device mapping.
- **Network interface attachment details** (e.g., `attached_instance_id`, `attachment_id`) are computed and not managed in code.

### Phantom Resources & Exclusions

- **Key pair `taher-private-runner` (key-07b4fecdf3b13a3b9)** was discovered but import failed ("Cannot import non-existent remote object"). The key pair no longer exists in AWS. It is excluded from `sg.tfvars` (`key_pairs = {}`) and not managed by Terraform. The instance still references the key name via string literal in `sg.tfvars`; if the key is recreated, the instance can reference it by name.

### Reconciliation Status

- **Plan output:** 0 to add, 0 to change, 0 to destroy
- **Drift detected:** None
- **State consistency:** All managed resources match their real-world counterparts
- **Remaining work:** None; code is production-ready

### Environment-Specific Overrides

All resource IDs, availability zones, and configuration details are stored in `environments/sg.tfvars`. To manage resources in a different AWS account or region, create a new `.tfvars` file with the corresponding resource IDs and apply it with `-var-file=environments/<env>.tfvars`. No `.tf` code changes are required.
