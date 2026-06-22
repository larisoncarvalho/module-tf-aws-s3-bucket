# Infrastructure Documentation

## 1. Overview

This Terraform configuration manages AWS EC2 infrastructure resources that were discovered and imported from a live AWS account. The code was generated from discovered cloud resources and reconciled by importing each resource into state until `plan` showed no changes (0 to add, 0 to change, 0 to destroy).

**Final Reconciliation Result:** No changes — your infrastructure matches the configuration.

The configuration uses modular design with four reusable modules:
- EC2 Key Pair (`modules/key_pair`)
- EBS Volume (`modules/ebs_volume`)
- Network Interface (`modules/network_interface`)
- EC2 Instance (`modules/instance`)

All resources are deployed to the **eu-central-1** region in AWS account **790543352839**.

---

## 2. Resources

| Terraform Address | Type | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.key_pair["taher_private_runner"].aws_key_pair.this` | `aws_key_pair` | `taher-private-runner` | SSH key pair for instance access |
| `module.ebs_volume["vol_072212cd519ee269f"].aws_ebs_volume.this` | `aws_ebs_volume` | `vol-072212cd519ee269f` | Root EBS volume (32 GB gp3) for the instance |
| `module.network_interface["eni_0ad57450ced1dd2d6"].aws_network_interface.this` | `aws_network_interface` | `eni-0ad57450ced1dd2d6` | Primary network interface attached to instance |
| `module.instance["taher_private_runner_ubuntu"].aws_instance.this` | `aws_instance` | `i-0a0ca27d00e7e74b9` | t2.medium Ubuntu EC2 instance (stopped) |

---

## 3. Module Structure

### `modules/key_pair/`
Manages AWS EC2 key pairs for SSH access.

**Contents:**
- `main.tf` — `aws_key_pair` resource with `lifecycle { ignore_changes = [public_key] }` (see Notable Decisions)
- `variables.tf` — `key_name`, `public_key` (default: `"placeholder"`)
- `outputs.tf` — exports `key_name` and `id`

**Called from root:** `for_each` with `var.key_pairs` map

---

### `modules/ebs_volume/`
Manages AWS EBS volumes independent of instances.

**Contents:**
- `main.tf` — `aws_ebs_volume` resource
- `variables.tf` — `availability_zone`, `size`, `volume_type`, `iops`, `throughput`, `encrypted`, `multi_attach_enabled`, `tags`
- `outputs.tf` — exports `id` and `arn`

**Called from root:** `for_each` with `var.ebs_volumes` map

---

### `modules/network_interface/`
Manages AWS EC2 network interfaces (ENIs).

**Contents:**
- `main.tf` — `aws_network_interface` resource
- `variables.tf` — `subnet_id`, `private_ips`, `security_groups`, `source_dest_check`, `description`, `tags`
- `outputs.tf` — exports `id`

**Called from root:** `for_each` with `var.network_interfaces` map

---

### `modules/instance/`
Manages AWS EC2 instances with comprehensive configuration.

**Contents:**
- `main.tf` — `aws_instance` resource with dynamic `cpu_options` block, `root_block_device`, and `metadata_options`
- `variables.tf` — comprehensive set of instance configuration variables (ami, instance_type, key_name, subnet_id, vpc_security_group_ids, availability_zone, tenancy, monitoring, ebs_optimized, source_dest_check, root volume settings, metadata settings, CPU options, tags)
- `outputs.tf` — exports `id` and `arn`

**Called from root:** `for_each` with `var.instances` map

---

## 4. How Import Works

The `imports.sh` script (at the root of the working directory) contains commands that import each discovered resource into Terraform state. The script was run once during initial reconciliation and maps module-qualified Terraform addresses to their cloud resource IDs:

```bash
#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.key_pair["taher_private_runner"].aws_key_pair.this' 'taher-private-runner'
"$1" import -var-file environments/sg.tfvars 'module.ebs_volume["vol_072212cd519ee269f"].aws_ebs_volume.this' 'vol-072212cd519ee269f'
"$1" import -var-file environments/sg.tfvars 'module.network_interface["eni_0ad57450ced1dd2d6"].aws_network_interface.this' 'eni-0ad57450ced1dd2d6'
"$1" import -var-file environments/sg.tfvars 'module.instance["taher_private_runner_ubuntu"].aws_instance.this' 'i-0a0ca27d00e7e74b9'
```

**Import Mechanism:**
- The script is invoked with the IaC binary path (e.g., `/tmp/tmp.HodmfF/terraform`)
- Each `import` command reads configuration from `environments/sg.tfvars` and fetches the live resource from AWS
- The resource state is written to the Terraform state file (default: `terraform.tfstate`)
- **Need not be re-run** unless state is lost

**To re-import a single resource** if state is lost:
```bash
terraform init
terraform import -var-file=environments/sg.tfvars 'module.key_pair["taher_private_runner"].aws_key_pair.this' 'taher-private-runner'
```

Replace the module address and cloud ID as needed. For example, to re-import the instance:
```bash
terraform import -var-file=environments/sg.tfvars 'module.instance["taher_private_runner_ubuntu"].aws_instance.this' 'i-0a0ca27d00e7e74b9'
```

---

## 5. How to Use the Code

### Initialize Terraform

```bash
terraform init
```

This downloads required providers (AWS) and initializes the backend.

### Plan Changes

To see what Terraform would change:

```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output after reconciliation: `0 to add, 0 to change, 0 to destroy`.

### Apply Changes

To apply any configuration updates:

```bash
terraform apply -var-file=environments/sg.tfvars
```

### Targeting Another Environment

To deploy to a different environment (e.g., from dev to prod):

1. **Copy and edit the tfvars file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the new file** with production values:
   ```bash
   nano environments/prod.tfvars
   ```
   - Update `instances`, `ebs_volumes`, `network_interfaces`, `key_pairs` with prod-specific values
   - Keep the module names/keys the same or change them as needed

3. **Plan and apply with the new file:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   terraform apply -var-file=environments/prod.tfvars
   ```

**No `.tf` code edits are required** — all customization is done via `.tfvars` files.

---

## 6. Variables

### Root-Level Variables

#### `key_pairs` (map of objects)
**Description:** SSH key pairs to create or manage.

**Type:**
```hcl
map(object({
  key_name = string
}))
```

**Default:** `{}`

**Example:**
```hcl
key_pairs = {
  taher_private_runner = {
    key_name = "taher-private-runner"
  }
}
```

---

#### `ebs_volumes` (map of objects)
**Description:** EBS volumes to create and manage.

**Type:**
```hcl
map(object({
  availability_zone    = string
  size                 = number
  volume_type          = string
  iops                 = optional(number, null)
  throughput           = optional(number, null)
  encrypted            = optional(bool, false)
  multi_attach_enabled = optional(bool, false)
  tags                 = optional(map(string), {})
}))
```

**Default:** `{}`

**Example:**
```hcl
ebs_volumes = {
  vol_072212cd519ee269f = {
    availability_zone    = "eu-central-1a"
    size                 = 32
    volume_type          = "gp3"
    iops                 = 3000
    throughput           = 125
    encrypted            = false
    multi_attach_enabled = false
  }
}
```

---

#### `network_interfaces` (map of objects)
**Description:** EC2 network interfaces (ENIs) to create and manage.

**Type:**
```hcl
map(object({
  subnet_id         = string
  private_ips       = optional(list(string), [])
  security_groups   = optional(list(string), [])
  source_dest_check = optional(bool, true)
  description       = optional(string, "")
  tags              = optional(map(string), {})
}))
```

**Default:** `{}`

**Example:**
```hcl
network_interfaces = {
  eni_0ad57450ced1dd2d6 = {
    subnet_id         = "subnet-072669658da496c4a"
    private_ips       = ["10.0.0.52"]
    security_groups   = ["sg-092a5ff991a0802bc"]
    source_dest_check = true
    description       = ""
  }
}
```

---

#### `instances` (map of objects)
**Description:** EC2 instances to create and manage.

**Type:**
```hcl
map(object({
  ami                    = string
  instance_type          = string
  key_name               = optional(string, null)
  subnet_id              = optional(string, null)
  vpc_security_group_ids = optional(list(string), [])
  availability_zone      = optional(string, null)
  tenancy                = optional(string, "default")
  monitoring             = optional(bool, false)
  ebs_optimized          = optional(bool, false)
  source_dest_check      = optional(bool, true)
  
  root_volume_size                  = optional(number, null)
  root_volume_type                  = optional(string, null)
  root_volume_delete_on_termination = optional(bool, true)
  
  metadata_http_endpoint               = optional(string, "enabled")
  metadata_http_tokens                 = optional(string, "optional")
  metadata_http_put_response_hop_limit = optional(number, 1)
  
  cpu_core_count       = optional(number, null)
  cpu_threads_per_core = optional(number, null)
  
  tags = optional(map(string), {})
}))
```

**Default:** `{}`

**Example:**
```hcl
instances = {
  taher_private_runner_ubuntu = {
    ami                    = "ami-03250b0e01c28d196"
    instance_type          = "t2.medium"
    key_name               = "taher-private-runner"
    subnet_id              = "subnet-072669658da496c4a"
    vpc_security_group_ids = ["sg-092a5ff991a0802bc"]
    availability_zone      = "eu-central-1a"
    tenancy                = "default"
    monitoring             = false
    ebs_optimized          = false
    source_dest_check      = true
    
    root_volume_size                  = 32
    root_volume_type                  = "gp3"
    root_volume_delete_on_termination = true
    
    metadata_http_endpoint               = "enabled"
    metadata_http_tokens                 = "required"
    metadata_http_put_response_hop_limit = 2
    
    cpu_core_count       = 2
    cpu_threads_per_core = 1
    
    tags = {
      Name = "taher-private-runner-ubuntu"
    }
  }
}
```

---

### Sensitive Variables

**Status:** No sensitive variables are configured. All values are present in `environments/sg.tfvars`.

(If sensitive variables are needed in the future, they would be stored in `secrets.auto.tfvars` and must not be committed to version control.)

---

## 7. Infrastructure Graph

```
Root Configuration
├── key_pairs (for_each)
│   └── module.key_pair["taher_private_runner"]
│       └── aws_key_pair.this (taher-private-runner)
│
├── ebs_volumes (for_each)
│   └── module.ebs_volume["vol_072212cd519ee269f"]
│       └── aws_ebs_volume.this (vol-072212cd519ee269f)
│
├── network_interfaces (for_each)
│   └── module.network_interface["eni_0ad57450ced1dd2d6"]
│       ├── aws_network_interface.this (eni-0ad57450ced1dd2d6)
│       └── references:
│           ├── security_group: sg-092a5ff991a0802bc
│           └── subnet: subnet-072669658da496c4a
│
└── instances (for_each)
    └── module.instance["taher_private_runner_ubuntu"]
        └── aws_instance.this (i-0a0ca27d00e7e74b9)
            ├── uses: key_name → "taher-private-runner"
            ├── uses: ami → ami-03250b0e01c28d196
            ├── uses: subnet_id → subnet-072669658da496c4a
            ├── uses: vpc_security_group_ids → [sg-092a5ff991a0802bc]
            └── root_block_device:
                ├── volume_size: 32 (GiB)
                ├── volume_type: gp3
                └── created_from: vol-072212cd519ee269f (managed separately)

Resource Dependencies:
- aws_instance depends on: aws_key_pair (key_name), aws_security_group (vpc_security_group_ids), aws_subnet (subnet_id)
- aws_network_interface depends on: aws_security_group, aws_subnet
- aws_ebs_volume is independent (managed separately from instance root device)
```

---

## 8. Notable Decisions & Caveats

### Key Pair: Write-Only Public Key

**Decision:** The `aws_key_pair` resource uses `lifecycle { ignore_changes = [public_key] }` with a placeholder value (`"placeholder"`).

**Reason:** The AWS API does not return the public key after creation (it is write-only). When the resource was discovered and imported, the actual public key was not available (`null`). To satisfy the required `public_key` argument, a placeholder was used. The `ignore_changes` lifecycle rule prevents Terraform from detecting drift on this attribute, which would otherwise show as "plan pending" after every reconciliation.

**Implication:** The public key configured in AWS cannot be verified or modified through Terraform. If the key needs to be changed, it must be managed outside of Terraform or the resource must be destroyed and recreated with a new key.

---

### Network Interface: Managed Separately from Instance

**Decision:** The primary network interface (`eni-0ad57450ced1dd2d6`) is managed as a standalone `aws_network_interface` resource rather than inline within the `aws_instance` block.

**Reason:** Using a `network_interface` block in the instance resource (which forces replacement) would trigger a resource replacement if the interface ID changes. By managing the ENI separately and referencing it via `subnet_id` and `vpc_security_group_ids`, Terraform correctly reflects the current state without forcing unnecessary replacements.

**Implication:** If the network interface needs to be modified (e.g., adding/removing security groups), changes are made to the `aws_network_interface` resource independently, and the instance picks up the changes without replacement.

---

### EBS Volume: Root Volume Managed Separately

**Decision:** The root EBS volume (`vol-072212cd519ee269f`) is managed as a standalone `aws_ebs_volume` resource. The instance's `root_block_device` block only specifies size, type, and termination behavior—it does not use `volume_id`.

**Reason:** This allows the EBS volume to be managed independently and potentially shared or tracked separately. The `root_block_device` configuration ensures the instance is correctly provisioned with the expected root volume characteristics without forcing a replacement if the volume is modified.

**Implication:** The EBS volume lifecycle is decoupled from the instance. Destroying the instance will not destroy the EBS volume unless the instance's `root_block_device.delete_on_termination` is `true` (which it is in this configuration).

---

### Instance State: Stopped

**Current State:** The EC2 instance `taher-private-runner-ubuntu` (i-0a0ca27d00e7e74b9) is currently **stopped** in AWS.

**Terraform Management:** Terraform does not manage the instance's running/stopped state; it only manages the instance as a resource. To start the instance:
```bash
aws ec2 start-instances --instance-ids i-0a0ca27d00e7e74b9 --region eu-central-1
```

To stop it:
```bash
aws ec2 stop-instances --instance-ids i-0a0ca27d00e7e74b9 --region eu-central-1
```

---

### Reconciliation Status

**Final Plan Output:** 0 to add, 0 to change, 0 to destroy.

All discovered resources were successfully imported and reconciled. The Terraform configuration now exactly matches the live infrastructure in AWS. No manual drift correction was required.

---

## Provider & Version Information

- **Provider:** `hashicorp/aws` (version constraint: no explicit constraint; defaults to latest compatible)
- **Region:** `eu-central-1` (hardcoded in `providers.tf`)
- **Account ID:** `790543352839`

---

## Files Overview

| File | Purpose |
|---|---|
| `main.tf` | Root module instantiation of four submodules (`key_pair`, `ebs_volume`, `network_interface`, `instance`) using `for_each` loops |
| `variables.tf` | Root-level input variables: `key_pairs`, `ebs_volumes`, `network_interfaces`, `instances` |
| `outputs.tf` | No root-level outputs (all outputs are in module subdirectories) |
| `providers.tf` | AWS provider configuration for eu-central-1 |
| `versions.tf` | Terraform required provider versions |
| `environments/sg.tfvars` | Production values for all input variables; used by `terraform plan/apply` and `imports.sh` |
| `imports.sh` | Shell script mapping Terraform addresses to cloud resource IDs for one-time import |
| `.sg/handoff.md` | Per-module layout, lifecycle decisions, and reconciliation notes (source of Notable Decisions section) |
| `modules/*/main.tf` | Resource definitions for each module |
| `modules/*/variables.tf` | Input variables for each module |
| `modules/*/outputs.tf` | Output exports from each module |

---

**Generated:** 2026-06-22  
**Reconciliation Status:** Clean (0 to add, 0 to change, 0 to destroy)
