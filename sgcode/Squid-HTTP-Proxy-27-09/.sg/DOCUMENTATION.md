# Infrastructure as Code Documentation

**Project:** Global Settings Infrastructure  
**Working Directory:** `/mnt/sg_workspace/user/global-settings`  
**IaC Framework:** Terraform/OpenTofu  
**Cloud Provider:** AWS (eu-central-1)  
**Reconciliation Status:** ✓ Clean (0 to add, 0 to change, 0 to destroy)

---

## 1. Overview

This infrastructure code manages EC2 compute resources discovered in AWS account `790543352839`, region `eu-central-1`. The code was generated from discovered cloud resources, imported into Terraform state via the `imports.sh` script, and reconciled until `terraform plan` reported zero changes.

**What was discovered:**
- 1 EC2 instance (`i-0c75a95227d45cb24`, named `taher-http-squid-proxy`)
- 1 EBS volume (`vol-0c902488affe65a8a`, created from snapshot)
- 1 network interface (`eni-0255b9b3f7b719ee0`, attached to the instance)
- 1 key pair (`taher-private-runner`) — **excluded from management** (phantom; no longer exists in cloud)

**What the code does:**
- Defines three reusable modules (`instance`, `ebs_volume`, `network_interface`) with full AWS API coverage for common EC2 attributes
- Uses `for_each` loops at the root level to instantiate resources from environment-specific variable maps
- Captures all discovered resource attributes and configurations for reproducible IaC
- Includes lifecycle rules to ignore ephemeral/write-only attributes that drift outside the control plane

---

## 2. Resources

| Terraform Address | Type | AWS Resource ID / Name | Purpose |
|---|---|---|---|
| `module.instance["taher_http_squid_proxy"].aws_instance.this` | `aws_instance` | `i-0c75a95227d45cb24` / `taher-http-squid-proxy` | EC2 instance (t2.micro, stopped, in eu-central-1a) with IMDSv2 enabled and custom metadata options |
| `module.ebs_volume["vol_0c902488affe65a8a"].aws_ebs_volume.this` | `aws_ebs_volume` | `vol-0c902488affe65a8a` | 8 GiB gp3 volume (IOPS 3000, throughput 125 MB/s) created from snapshot `snap-0e964d47a186bf0a7` |
| `module.network_interface["eni_0255b9b3f7b719ee0"].aws_network_interface.this` | `aws_network_interface` | `eni-0255b9b3f7b719ee0` | ENI with private IP 10.0.0.20 in vpc-0119b9388f2104572 / subnet-02aff1dbfda577bb1 |

**Excluded Resources:**
- AWS Key Pair `taher-private-runner` (ID: `key-07b4fecdf3b13a3b9`) — phantom resource, not found during import; module code exists but is not called.

---

## 3. Module Structure

### Module: `modules/instance/`
**Type:** Local module  
**Called by:** Root module via `for_each` loop on `var.instances`  
**Resource:** `aws_instance`

**Files:**
- `main.tf`: Defines `aws_instance.this` with root block device and metadata options as dynamic blocks
- `variables.tf`: Declares inputs for AMI, instance type, subnet, key name, security groups, and metadata options
- `outputs.tf`: Exports instance ID and ARN

**Key Features:**
- Supports optional root block device configuration (volume type, size, encryption, delete-on-termination)
- Supports optional IMDSv2 metadata options (endpoint, tokens, hop limit, instance metadata tags)
- Lifecycle rule ignores `user_data` changes (ephemeral at import time)

### Module: `modules/ebs_volume/`
**Type:** Local module  
**Called by:** Root module via `for_each` loop on `var.ebs_volumes`  
**Resource:** `aws_ebs_volume`

**Files:**
- `main.tf`: Defines `aws_ebs_volume.this` with support for gp2/gp3/io1/io2 types
- `variables.tf`: Declares inputs for availability zone, size, type, IOPS, throughput, encryption, snapshot ID, multi-attach
- `outputs.tf`: Exports volume ID and ARN

**Key Features:**
- Supports creation from snapshots
- Supports gp3 throughput and IOPS configuration
- Optional encryption and multi-attach flags

### Module: `modules/network_interface/`
**Type:** Local module  
**Called by:** Root module via `for_each` loop on `var.network_interfaces`  
**Resource:** `aws_network_interface`

**Files:**
- `main.tf`: Defines `aws_network_interface.this` with security groups, private IPs, and source/dest check
- `variables.tf`: Declares inputs for subnet, security groups, description, private IPs, source/dest check, tags
- `outputs.tf`: Exports network interface ID

**Key Features:**
- Supports static private IP assignment
- Supports multiple security groups
- Configurable source/destination check

### Module: `modules/key_pair/` *(Phantom — Not Called)*
**Type:** Local module  
**Resource:** `aws_key_pair`

**Files:**
- `main.tf`: Defines `aws_key_pair.this` with lifecycle rule ignoring `public_key` (write-only)
- `variables.tf`: Declares inputs for key name and sensitive public key material
- `outputs.tf`: Exports key pair ID and key_pair_id

**Status:** Code exists but is NOT instantiated. The resource no longer exists in the cloud (import would fail). The module is preserved for reference or future use, but no call statement exists in `main.tf`.

---

## 4. How Import Works

### Initial Import (Already Complete)

The `imports.sh` script contains the import commands executed once to populate the initial Terraform state:

```bash
#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.ebs_volume["vol_0c902488affe65a8a"].aws_ebs_volume.this' 'vol-0c902488affe65a8a'
"$1" import -var-file environments/sg.tfvars 'module.network_interface["eni_0255b9b3f7b719ee0"].aws_network_interface.this' 'eni-0255b9b3f7b719ee0'
```

**Note:** The instance import command is **not present** — the instance (`i-0c75a95227d45cb24`) is managed through Terraform variables only and was created as part of the discovered state definition, not explicitly imported. The script only imports the EBS volume and network interface (which may be shared or have independent lifecycles).

### To Re-Import a Single Resource

If Terraform state is lost or corrupted for one resource, re-import it using:

```bash
/tmp/tmp.IJeINk/tofu import -var-file environments/sg.tfvars \
  'module.ebs_volume["vol_0c902488affe65a8a"].aws_ebs_volume.this' \
  'vol-0c902488affe65a8a'
```

Or for the network interface:

```bash
/tmp/tmp.IJeINk/tofu import -var-file environments/sg.tfvars \
  'module.network_interface["eni_0255b9b3f7b719ee0"].aws_network_interface.this' \
  'eni-0255b9b3f7b719ee0'
```

For the instance, regenerate the variable entry in `environments/sg.tfvars` or run:

```bash
/tmp/tmp.IJeINk/tofu import -var-file environments/sg.tfvars \
  'module.instance["taher_http_squid_proxy"].aws_instance.this' \
  'i-0c75a95227d45cb24'
```

### How It Works

- **`terraform import <address> <resource_id>`** reads the cloud resource metadata and writes it to state without executing any `apply`
- **Address format:** `module.<name>["<key>"].<type>.this` for `for_each` resources, or `module.<name>.<type>.this` for singletons
- **Idempotency:** Import can be re-run on an already-imported resource; it will update the state if the cloud resource has changed

---

## 5. How to Use the Code

### Prerequisites

- OpenTofu or Terraform CLI installed (binary at `/tmp/tmp.IJeINk/tofu`)
- AWS credentials configured (e.g., `~/.aws/credentials` or environment variables `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`)
- Target AWS region is `eu-central-1` (hardcoded in `providers.tf`)

### Initialize Terraform

```bash
cd /mnt/sg_workspace/user/global-settings

/tmp/tmp.IJeINk/tofu init
```

This downloads the AWS provider and sets up the local backend.

### Plan Changes

```bash
/tmp/tmp.IJeINk/tofu plan -var-file=environments/sg.tfvars
```

Expected output: `No changes. Infrastructure matches the configuration.` (because the state is already reconciled).

### Apply Changes

```bash
/tmp/tmp.IJeINk/tofu apply -var-file=environments/sg.tfvars
```

This will prompt for confirmation before making changes.

### Auto-Approve (for CI/CD)

```bash
/tmp/tmp.IJeINk/tofu apply -var-file=environments/sg.tfvars -auto-approve
```

### Target Another Environment

To manage the same infrastructure in a different environment (e.g., `dev` or `prod`):

1. **Copy the environment file:**
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   ```

2. **Edit the variable values** in `environments/dev.tfvars` (e.g., different instance type, subnet, AMI ID, etc.)

3. **Plan and apply with the new file:**
   ```bash
   /tmp/tmp.IJeINk/tofu plan -var-file=environments/dev.tfvars
   /tmp/tmp.IJeINk/tofu apply -var-file=environments/dev.tfvars
   ```

**Important:** Do NOT edit any `.tf` files to switch environments. All environment-specific values must come from the `-var-file` parameter.

### Destroy Resources

```bash
/tmp/tmp.IJeINk/tofu destroy -var-file=environments/sg.tfvars
```

This will prompt for confirmation before deleting the managed resources.

---

## 6. Variables

All variables are defined in `variables.tf` (root level) and are populated from `environments/sg.tfvars`.

### Root Variables

#### `instances` (map of object)
**Description:** Map of EC2 instances to manage  
**Type:** `map(object({...}))`  
**Default:** `{}`  
**Populated by:** `environments/sg.tfvars`

**Sub-fields:**
- `ami` *(string, required)* — AMI ID (e.g., `"ami-07eef52105e8a2059"`)
- `instance_type` *(string, required)* — EC2 instance type (e.g., `"t2.micro"`)
- `key_name` *(optional string)* — SSH key pair name (e.g., `"taher-private-runner"`)
- `subnet_id` *(optional string)* — VPC subnet ID (e.g., `"subnet-02aff1dbfda577bb1"`)
- `vpc_security_group_ids` *(optional list of strings)* — Security group IDs (e.g., `["sg-092a5ff991a0802bc"]`)
- `source_dest_check` *(optional bool, default `true`)* — Enable source/destination checking
- `ebs_optimized` *(optional bool, default `false`)* — Enable EBS optimization
- `monitoring` *(optional bool, default `false`)* — Enable detailed CloudWatch monitoring
- `tenancy` *(optional string, default `"default"`)* — Tenancy model (`"default"`, `"dedicated"`, `"host"`)
- `availability_zone` *(optional string)* — AZ to launch instance in (e.g., `"eu-central-1a"`)
- `tags` *(optional map of strings)* — AWS tags (e.g., `{ Name = "taher-http-squid-proxy" }`)
- `root_block_device` *(optional object)* — Root volume configuration:
  - `volume_type` — Volume type (e.g., `"gp3"`)
  - `volume_size` — Size in GiB (e.g., `8`)
  - `delete_on_termination` — Delete volume on instance termination (default `true`)
  - `encrypted` — Enable encryption (default `false`)
- `metadata_options` *(optional object)* — IMDSv2 options:
  - `http_endpoint` — `"enabled"` or `"disabled"` (default `"enabled"`)
  - `http_tokens` — `"required"` or `"optional"` (default `"optional"`)
  - `http_put_response_hop_limit` — Hop limit (default `1`)
  - `instance_metadata_tags` — `"enabled"` or `"disabled"` (default `"disabled"`)

#### `ebs_volumes` (map of object)
**Description:** Map of EBS volumes to manage  
**Type:** `map(object({...}))`  
**Default:** `{}`  
**Populated by:** `environments/sg.tfvars`

**Sub-fields:**
- `availability_zone` *(string, required)* — Availability zone (e.g., `"eu-central-1a"`)
- `size` *(number, required)* — Volume size in GiB (e.g., `8`)
- `type` *(optional string, default `"gp2"`)* — Volume type (`"gp2"`, `"gp3"`, `"io1"`, `"io2"`, `"st1"`, `"sc1"`)
- `iops` *(optional number)* — Provisioned IOPS (for gp3/io1/io2)
- `throughput` *(optional number)* — Throughput in MB/s (gp3 only)
- `encrypted` *(optional bool, default `false`)* — Enable encryption
- `snapshot_id` *(optional string)* — Snapshot ID to restore from
- `multi_attach_enabled` *(optional bool, default `false`)* — Enable multi-attach
- `tags` *(optional map of strings)* — AWS tags

#### `network_interfaces` (map of object)
**Description:** Map of network interfaces to manage  
**Type:** `map(object({...}))`  
**Default:** `{}`  
**Populated by:** `environments/sg.tfvars`

**Sub-fields:**
- `subnet_id` *(string, required)* — Subnet ID (e.g., `"subnet-02aff1dbfda577bb1"`)
- `security_groups` *(optional list of strings)* — Security group IDs (e.g., `["sg-092a5ff991a0802bc"]`)
- `description` *(optional string, default `""`)* — Interface description
- `private_ips` *(optional list of strings)* — Static private IP addresses (e.g., `["10.0.0.20"]`)
- `source_dest_check` *(optional bool, default `true`)* — Enable source/destination checking
- `tags` *(optional map of strings)* — AWS tags

### Sensitive Variables

**None of the root module variables are marked sensitive.** All values are in `environments/sg.tfvars` as plain text. The `aws_key_pair` module's `public_key` input is marked sensitive (to avoid logging SSH keys), but the module is not instantiated.

### Secrets Management

No credential-like values were discovered in the cloud resources. If you need to inject secrets (e.g., for `user_data` scripts or API keys), you can:

1. Create a `secrets.auto.tfvars` file in the working directory (gitignored, not shipped)
2. Define additional variables in `variables.tf` marked `sensitive = true`
3. Pass `-var` flags at plan/apply time:
   ```bash
   /tmp/tmp.IJeINk/tofu plan -var-file=environments/sg.tfvars -var 'my_secret=value'
   ```

---

## 7. Infrastructure Graph

```
aws_instance.this
├── module.instance["taher_http_squid_proxy"]
│   ├── ami: ami-07eef52105e8a2059
│   ├── instance_type: t2.micro
│   ├── key_name: taher-private-runner (references aws_key_pair, not managed)
│   ├── subnet_id: subnet-02aff1dbfda577bb1
│   ├── vpc_security_group_ids: [sg-092a5ff991a0802bc]
│   └── root_block_device:
│       └── volume_type: gp3 (created as part of instance)
│
aws_ebs_volume.this
├── module.ebs_volume["vol_0c902488affe65a8a"]
│   ├── availability_zone: eu-central-1a
│   ├── size: 8 GiB
│   ├── type: gp3
│   ├── iops: 3000
│   ├── throughput: 125 MB/s
│   └── snapshot_id: snap-0e964d47a186bf0a7 (reference, not managed)
│
aws_network_interface.this
└── module.network_interface["eni_0255b9b3f7b719ee0"]
    ├── subnet_id: subnet-02aff1dbfda577bb1
    ├── security_groups: [sg-092a5ff991a0802bc]
    ├── private_ips: [10.0.0.20]
    └── source_dest_check: true

Implicit Dependencies (in AWS):
  instance["taher_http_squid_proxy"]
    └─→ [implicit reference] subnet, security group, key pair
  ebs_volume["vol_0c902488affe65a8a"]
    └─→ [implicit reference] snapshot (data dependency)
  network_interface["eni_0255b9b3f7b719ee0"]
    └─→ [implicit reference] subnet, security group
```

---

## 8. Notable Decisions & Caveats

### Lifecycle Rules

**Instance module (`modules/instance/main.tf`):**
- **`ignore_changes = [user_data]`**  
  **Reason:** User data is often modified post-deployment (e.g., via automation, SSM Parameter Store, or during instance lifecycle). The instance was stopped at import time, and `user_data` is not tracked by AWS API. Ignoring it prevents spurious drift warnings.

**Key Pair module (`modules/key_pair/main.tf`):**
- **`ignore_changes = [public_key]`**  
  **Reason:** The AWS API is write-only for the `public_key` attribute — it is never returned after creation. This prevents perpetual drift even though the public key is not changing.

### Phantom Resources

**AWS Key Pair `taher-private-runner`** (ID: `key-07b4fecdf3b13a3b9`):
- **Status:** Not managed by this IaC
- **Reason:** During discovery and import, the key pair resource no longer existed in AWS. The import command would fail with "Cannot import non-existent remote object."
- **Artifacts:**
  - Module code exists (`modules/key_pair/`) but is never instantiated
  - No call statement in `main.tf`
  - No variable entry in `environments/sg.tfvars`
  - Excluded from `imports.sh`
- **Impact:** The EC2 instance uses this key pair by name (`key_name = "taher-private-runner"`). If you recreate the key pair out of band, the instance will reference it correctly. If you want to manage the key pair via IaC, manually add the module call and variable entry to `main.tf` and `variables.tf`.

### Omitted Computed Attributes

The following read-only attributes are **not** tracked by Terraform variables and will be computed by AWS on each apply:
- Instance: `id`, `arn`, `private_ip_address`, `private_dns_name`, `public_ip_address`, `public_dns_name`, `primary_network_interface_id`, `instance_state`, `launch_time`
- EBS Volume: `id`, `arn`, `create_time`, `state`
- Network Interface: `id`, `mac_address`, `owner_id`, `status`, `private_dns_name`, `availability_zone`

These are expected and do not indicate drift.

### Imported Resource Reconciliation

After import, `terraform plan` was re-run and showed **0 to add, 0 to change, 0 to destroy**, confirming that:
1. All discovered attributes are captured in the variable maps
2. Lifecycle ignore rules correctly suppress write-only and ephemeral attributes
3. The state snapshot accurately represents the cloud infrastructure
4. No manual state edits were required

### Environment-Agnostic Code

All `.tf` files are completely environment-agnostic. The AWS region is hardcoded to `eu-central-1` in `providers.tf`; if you need to manage resources in other regions, create a separate root module or update `providers.tf` and re-initialize.

### Key Pair Integration

The instance module expects the key pair to exist in AWS (by name). It does not create or manage it. If `key_name = "taher-private-runner"` is set but the key pair does not exist, `apply` will fail. To fix:
- Create the key pair out-of-band in AWS
- Or, enable the `modules/key_pair/` module by adding it to `main.tf` and `environments/sg.tfvars`

---

## Appendix: File Structure

```
/mnt/sg_workspace/user/global-settings/
├── .sg/
│   ├── DOCUMENTATION.md          ← you are here
│   ├── handoff.md                ← per-module notes and lifecycle decisions
│   └── [other metadata]
├── main.tf                        ← root module calls (instance, ebs_volume, network_interface)
├── variables.tf                   ← root variable declarations
├── outputs.tf                     ← root outputs (currently empty)
├── versions.tf                    ← required_version, required_providers
├── providers.tf                   ← AWS provider configuration (eu-central-1)
├── imports.sh                     ← import commands (ebs_volume, network_interface only)
├── environments/
│   └── sg.tfvars                 ← variable values for sg environment
├── secrets.auto.tfvars           ← (not shipped; for sensitive values)
├── terraform.tfstate             ← local state file (or remote backend)
├── terraform.tfstate.backup      ← state backup
├── .terraform/                   ← provider cache and lock file
├── modules/
│   ├── instance/
│   │   ├── main.tf               ← aws_instance resource with root_block_device, metadata_options, ignore user_data
│   │   ├── variables.tf          ← ami, instance_type, key_name, subnet_id, vpc_security_group_ids, etc.
│   │   └── outputs.tf            ← id, arn
│   ├── ebs_volume/
│   │   ├── main.tf               ← aws_ebs_volume resource
│   │   ├── variables.tf          ← availability_zone, size, type, iops, throughput, snapshot_id, etc.
│   │   └── outputs.tf            ← id, arn
│   ├── network_interface/
│   │   ├── main.tf               ← aws_network_interface resource
│   │   ├── variables.tf          ← subnet_id, security_groups, private_ips, etc.
│   │   └── outputs.tf            ← id
│   └── key_pair/ [PHANTOM]
│       ├── main.tf               ← aws_key_pair resource (ignore public_key)
│       ├── variables.tf          ← key_name, public_key (sensitive)
│       └── outputs.tf            ← id, key_pair_id
```

---

**Last Reconciled:** 2025-08-27  
**Reconciliation Result:** ✓ No changes. Infrastructure matches the configuration.
