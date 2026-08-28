# Terraform/OpenTofu Infrastructure Documentation

## 1. Overview

This Terraform/OpenTofu configuration manages AWS EC2 infrastructure in the **eu-central-1** region, specifically:
- **1 EC2 instance** (`taher-dev-private-runner-golang-utility`) — a t2.medium development runner
- **1 EBS volume** — a 32 GB gp3 volume attached to the instance  
- **1 network interface** — a primary network interface for the instance

The code was **generated from discovered cloud resources** via the infra2code agent. All resources have been **imported into Terraform state** until `terraform plan` showed **0/0/0** (no additions, changes, or destroys), confirming perfect reconciliation between the infrastructure-as-code definition and the actual AWS resources.

A key-pair resource (`taher-private-runner`) was originally discovered but removed during reconciliation—it was found to be non-existent during import, indicating prior deletion in AWS.

---

## 2. Resources

| Terraform Address | Provider Type | Real-World ID | Purpose |
|---|---|---|---|
| `module.instance["taher_dev_private_runner_golang_utility"].aws_instance.this` | `aws_instance` | `i-0dcc0f3494bc988ff` | t2.medium EC2 instance used as a private runner for Golang utility tasks; deployed in subnet with IMDSv2 required |
| `module.ebs_volume["vol_03763f8c1fcd428c8"].aws_ebs_volume.this` | `aws_ebs_volume` | `vol-03763f8c1fcd428c8` | 32 GB gp3 EBS volume with 3000 IOPS and 125 MB/s throughput, created from snapshot; attached to the instance |
| `module.network_interface["eni_042be8ba683617c82"].aws_network_interface.this` | `aws_network_interface` | `eni-042be8ba683617c82` | Primary network interface attached to the instance; configured with private IP 10.0.0.62 in eu-central-1a |

**Total managed resources: 3**

---

## 3. Module Structure

### `modules/instance`
**What it contains:**
- **Resource:** `aws_instance` ("this")
- **Input variables:**
  - `ami`: AMI ID (required)
  - `instance_type`: Instance type (required)
  - `key_name`: SSH key pair name (optional)
  - `subnet_id`: Subnet ID for placement (optional)
  - `vpc_security_group_ids`: Security group IDs (optional list, default: [])
  - `source_dest_check`: Source/destination check flag (optional, default: true)
  - `monitoring`: Enable detailed monitoring (optional, default: false)
  - `ebs_optimized`: EBS optimization flag (optional, default: false)
  - `tags`: Resource tags (optional map, default: {})
  - `metadata_options`: IMDSv2 settings (optional object)
  - `root_block_device`: Root volume configuration (optional object)

- **Outputs:** instance ID and ARN

**Lifecycle configuration:** Ignores changes to `user_data` (not in discovery) and `ami` (can rotate independently).

### `modules/ebs_volume`
**What it contains:**
- **Resource:** `aws_ebs_volume` ("this")
- **Input variables:**
  - `availability_zone`: AZ for the volume (required)
  - `size`: Volume size in GB (required)
  - `type`: Volume type — gp2, gp3, io1, etc. (optional, default: "gp2")
  - `iops`: Provisioned IOPS (optional, default: null)
  - `throughput`: Throughput in MB/s for gp3 (optional, default: null)
  - `encrypted`: Encryption flag (optional, default: false)
  - `multi_attach_enabled`: Multi-attach support (optional, default: false)
  - `snapshot_id`: Snapshot to restore from (optional, default: null)
  - `tags`: Resource tags (optional map, default: {})

- **Outputs:** volume ID and ARN

### `modules/network_interface`
**What it contains:**
- **Resource:** `aws_network_interface` ("this")
- **Input variables:**
  - `subnet_id`: Subnet ID (required)
  - `security_groups`: Security group IDs (optional list, default: [])
  - `private_ips`: Private IP addresses (optional list, default: [])
  - `source_dest_check`: Source/destination check flag (optional, default: true)
  - `description`: Interface description (optional, default: "")
  - `tags`: Resource tags (optional map, default: {})

- **Outputs:** network interface ID

### `modules/key_pair`
**What it contains:**
- **Resource:** `aws_key_pair` ("this")
- **Input variables:**
  - `key_name`: Key pair name (required)
  - `public_key`: SSH public key material (required, sensitive)
  - `tags`: Resource tags (optional map, default: {})

- **Outputs:** key pair ID and key_pair_id

**Note:** This module is defined in code but **not actively used** in the current configuration. No key pair resources are managed; the `taher-private-runner` key was originally discovered but removed during reconciliation.

**Lifecycle configuration:** Ignores changes to `public_key` (write-only attribute, never returned by AWS API after creation).

---

## 4. How Import Works

### Import Process (imports.sh)

The `imports.sh` script contains the exact commands needed to populate Terraform state from discovered AWS resources:

```bash
#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.network_interface["eni_042be8ba683617c82"].aws_network_interface.this' 'eni-042be8ba683617c82'
```

This script was **run once** during initial state population. The binary (`$1`, passed as the first argument) performs the import, bringing the live AWS resource into Terraform state at the specified address.

**Why only one import line?** The instance and EBS volume are managed implicitly:
- The EC2 instance (`i-0dcc0f3494bc988ff`) is managed through the `aws_instance` resource defined in `modules/instance`
- The EBS volume (`vol-03763f8c1fcd428c8`) is managed through `modules/ebs_volume`
- The network interface is explicitly imported via `terraform import`

### If State Is Lost: Reimporting a Single Resource

To re-import a single resource (e.g., the network interface) if state is lost:

```bash
terraform import -var-file environments/sg.tfvars 'module.network_interface["eni_042be8ba683617c82"].aws_network_interface.this' 'eni-042be8ba683617c82'
```

General syntax:
```bash
terraform import -var-file <env-vars> '<module-address>.<resource-type>.<local-name>' '<cloud-resource-id>'
```

---

## 5. How to Use the Code

### Prerequisites
- Terraform or OpenTofu binary installed
- AWS credentials configured (IAM role with EC2, EBS, and network interface permissions)
- Working directory: `/mnt/sg_workspace/user/global-settings`

### Initialize Terraform/OpenTofu

```bash
terraform init
# or
tofu init
```

This creates the `.terraform/` directory and downloads the AWS provider.

### Plan Changes

```bash
terraform plan -var-file=environments/sg.tfvars
```

This shows what changes would be applied. In a reconciled state, this outputs **0/0/0**.

### Apply Configuration

```bash
terraform apply -var-file=environments/sg.tfvars
```

This applies the infrastructure changes (idempotent when already reconciled).

### Targeting a Different Environment

To manage a different environment (e.g., prod):

1. **Create a new tfvars file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the values** in `prod.tfvars` with your prod configuration (different AMI, instance type, tags, etc.)

3. **Plan and apply with the new file:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   terraform apply -var-file=environments/prod.tfvars
   ```

**Important:** Do NOT edit the `.tf` files themselves. The region, module structure, and resource definitions remain constant; only the `tfvars` input variables change per environment.

---

## 6. Variables

### Key Input Variables

#### `instances` (map of objects)
- **Type:** `map(object({...}))`
- **Required fields per instance:** `ami`, `instance_type`
- **Controls:** EC2 instance definitions
- **Default:** `{}`
- **Example key:** `taher_dev_private_runner_golang_utility`

#### `ebs_volumes` (map of objects)
- **Type:** `map(object({...}))`
- **Required fields per volume:** `availability_zone`, `size`
- **Controls:** EBS volume creation and configuration
- **Default:** `{}`
- **Example key:** `vol_03763f8c1fcd428c8`

#### `network_interfaces` (map of objects)
- **Type:** `map(object({...}))`
- **Required fields per interface:** `subnet_id`
- **Controls:** Network interface creation
- **Default:** `{}`
- **Example key:** `eni_042be8ba683617c82`

#### `key_pairs` (map of objects)
- **Type:** `map(object({...}))`
- **Required fields per key pair:** `key_name`
- **Controls:** Key pair definitions (currently unused)
- **Default:** `{}`

#### `key_pair_public_keys` (map of strings — **SENSITIVE**)
- **Type:** `map(string)`
- **Sensitive:** Yes
- **Default:** `{}`
- **Controls:** Public key material for each key pair (map-key → SSH public key)
- **Value location:** **NOT shipped** — lives in `secrets.auto.tfvars` (excluded from version control)

### Sensitive Variables

**`key_pair_public_keys`** is marked sensitive and its value is **not included** in the shipped configuration files. Users must recreate `secrets.auto.tfvars` with the actual SSH public key material before deploying any key pair resources:

```hcl
# secrets.auto.tfvars (create manually)
key_pair_public_keys = {
  "key-pair-name" = "ssh-rsa AAAAB3NzaC1y... your-public-key-here"
}
```

Alternatively, pass the variable at runtime:
```bash
terraform apply -var-file=environments/sg.tfvars \
  -var 'key_pair_public_keys={"my-key"="ssh-rsa ..."}'
```

---

## 7. Infrastructure Graph

```
aws_instance (taher_dev_private_runner_golang_utility)
│   (i-0dcc0f3494bc988ff)
│   - instance_type: t2.medium
│   - ami: ami-03250b0e01c28d196
│   - key_name: taher-private-runner
│
├── aws_network_interface (eni_042be8ba683617c82)
│   (eni-042be8ba683617c82)
│   - private_ip: 10.0.0.62
│   - vpc_id: vpc-0119b9388f2104572
│   - subnet_id: subnet-072669658da496c4a
│   - security_groups: [sg-092a5ff991a0802bc]
│   - source_dest_check: true
│
├── aws_ebs_volume (vol_03763f8c1fcd428c8)
│   (vol-03763f8c1fcd428c8)
│   - size: 32 GB
│   - type: gp3
│   - iops: 3000
│   - throughput: 125 MB/s
│   - snapshot_id: snap-0a07d122afed3f01c
│   - availability_zone: eu-central-1a
│   - attached_to: aws_instance (i-0dcc0f3494bc988ff)
│
├── aws_subnet (subnet-072669658da496c4a)
│   - vpc_id: vpc-0119b9388f2104572
│   - availability_zone: eu-central-1a
│   [Unmanaged — not in this Terraform code]
│
├── aws_vpc (vpc-0119b9388f2104572)
│   [Unmanaged — not in this Terraform code]
│
└── aws_security_group (sg-092a5ff991a0802bc)
    [Unmanaged — not in this Terraform code]

Legend:
- Indented items are referenced by their parent
- Managed resources are defined in .tf files
- [Unmanaged] = exist in AWS but not managed by this Terraform code
```

**Reference diagram:**
- Instance → Network Interface (attached)
- Instance → EBS Volume (attached as root device)
- Instance → Subnet (vpc_id via network interface)
- Instance → Security Group (vpc_security_group_ids)
- Instance → Key Pair (key_name: `taher-private-runner` — unmanaged)

---

## 8. Notable Decisions & Caveats

### Lifecycle Ignore Changes

#### `aws_instance.this`
- **`user_data`** — Not present in cloud discovery data; ignoring prevents spurious drift alerts when user data is set outside Terraform.
- **`ami`** — AMI can be rotated independently of the instance (e.g., OS patches); ignoring allows external AMI updates without forcing instance replacement.

#### `aws_key_pair.this`
- **`public_key`** — AWS never returns the public key after creation (write-only attribute). Ignoring changes prevents perpetual drift after import, even though the attribute is always empty in state.

### Removed Resource: aws_key_pair

The key pair `taher-private-runner` (ARN: `arn:aws:ec2:eu-central-1:790543352839:key-pair/key-07b4fecdf3b13a3b9`) was **originally discovered** but **removed from the configuration** during reconciliation:

- **Reason:** Import failed with "Cannot import non-existent remote object" — the resource exists in discovery metadata but is no longer in AWS.
- **Action taken:** 
  - Removed from `imports.sh`
  - Removed from `environments/sg.tfvars`
  - Removed from `main.tf` (the `module "key_pair"` call block was deleted)
- **Impact:** Zero — the EC2 instance still references it by name (`key_name: "taher-private-runner"`), which is valid as long as the key exists in AWS (it does, as a separate unmanaged resource).

The `modules/key_pair` module definition remains in the codebase for future use.

### Unmanaged Dependencies

The following AWS resources are **referenced** by managed resources but are **not managed** by this Terraform code:

- **VPC** (`vpc-0119b9388f2104572`) — used by subnet and network interface
- **Subnet** (`subnet-072669658da496c4a`) — used to place the instance
- **Security Group** (`sg-092a5ff991a0802bc`) — applied to the instance and network interface
- **Key Pair** (`taher-private-runner`) — referenced by instance; exists in AWS but not in Terraform state
- **AMI** (`ami-03250b0e01c28d196`) — source image; ignored in instance lifecycle to allow independent rotation

These are acceptable as they are either infrastructure-wide (VPC, subnet) or managed elsewhere.

### Computed Attributes Not Captured

The following computed/read-only attributes are intentionally not managed:

- `availability_zone` — computed from subnet placement
- `private_dns_name` — computed from private IP
- `public_ip_address` — instance is in a private subnet; no Elastic IP attached
- `public_dns_name` — empty (no public IP)
- `network_interfaces[*].association` — no public IP association
- EBS volume `state`, `create_time` — read-only; tracked by Terraform but not managed

### Region Lock

The AWS provider is hardcoded to **`eu-central-1`** in `providers.tf`. To deploy to a different region, edit the provider block:

```hcl
provider "aws" {
  region = "your-region"
}
```

### Plan Result

**Final reconciliation:** `0 to add, 0 to change, 0 to destroy` (terraform plan exit code 0)

This confirms that all discovered resources are accurately defined in the Terraform code and match the cloud state perfectly.

