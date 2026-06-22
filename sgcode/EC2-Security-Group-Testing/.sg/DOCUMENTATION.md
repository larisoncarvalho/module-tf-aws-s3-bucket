# Infrastructure Documentation

## 1. Overview

This Terraform configuration manages two AWS EC2 resources discovered in the `eu-central-1` region:

1. An EC2 instance (`i-0a69c0ca1342b636c`) named `sg-created-test-instance`
2. A network interface (`eni-0fef14b2c7dd7d059`) attached as the primary network interface to the instance

The code was generated from these discovered cloud resources, imported into Terraform state, and reconciled until the plan showed **0/0/0** (no additions, changes, or deletions). The infrastructure is now fully under Terraform management with no drift.

---

## 2. Resources

| Terraform Address | Type | Cloud ID | Name | Purpose |
|---|---|---|---|---|
| `module.instance["sg_created_test_instance"].aws_instance.this` | `aws_instance` | `i-0a69c0ca1342b636c` | sg-created-test-instance | Primary EC2 compute instance (t3.micro) in the VPC |
| `module.network_interface["eni_0fef14b2c7dd7d059"].aws_network_interface.this` | `aws_network_interface` | `eni-0fef14b2c7dd7d059` | eni-0fef14b2c7dd7d059 | Primary network interface (device index 0) attached to the EC2 instance |

---

## 3. Module Structure

### modules/instance

**Purpose:** Encapsulates AWS EC2 instance configuration.

**Contents:**
- `main.tf`: Defines the `aws_instance` resource with metadata options block
- `variables.tf`: Instance parameters (AMI, instance type, subnet, security groups, availability zone, EBS optimization, monitoring, tags)
- `outputs.tf`: Exports instance ID and ARN

**Called from:** Root via `module.instance` with `for_each = var.instances`

**Key configuration:**
- Metadata options explicitly set: `http_endpoint=enabled`, `http_tokens=optional`, `http_put_response_hop_limit=1`, `http_protocol_ipv6=disabled`, `instance_metadata_tags=disabled`
- EBS optimization: disabled
- Monitoring: disabled
- No IAM instance profile (null in discovered state)
- No key pair (null in discovered state)

### modules/network_interface

**Purpose:** Encapsulates AWS network interface configuration.

**Contents:**
- `main.tf`: Defines the `aws_network_interface` resource
- `variables.tf`: Network interface parameters (subnet, security groups, private IP, source/dest check, description, tags)
- `outputs.tf`: Exports network interface ID

**Called from:** Root via `module.network_interface` with `for_each = var.network_interfaces`

**Key configuration:**
- Private IP: 10.0.0.113 (static assignment from discovered state)
- Source destination check: enabled
- Security group: default VPC security group (sg-064cbb231ba1bca24)

---

## 4. How Import Works

The `imports.sh` script was executed once during initial setup to import the discovered resources into Terraform state. It contains two import commands:

```bash
"$1" import -var-file environments/sg.tfvars 'module.instance["sg_created_test_instance"].aws_instance.this' 'i-0a69c0ca1342b636c'
"$1" import -var-file environments/sg.tfvars 'module.network_interface["eni_0fef14b2c7dd7d059"].aws_network_interface.this' 'eni-0fef14b2c7dd7d059'
```

**Script execution:**
```bash
./imports.sh /path/to/terraform
```

where `/path/to/terraform` is the Terraform binary (or OpenTofu).

**Re-importing a single resource** (if state is lost):

For the EC2 instance:
```bash
terraform import -var-file=environments/sg.tfvars \
  'module.instance["sg_created_test_instance"].aws_instance.this' \
  'i-0a69c0ca1342b636c'
```

For the network interface:
```bash
terraform import -var-file=environments/sg.tfvars \
  'module.network_interface["eni_0fef14b2c7dd7d059"].aws_network_interface.this' \
  'eni-0fef14b2c7dd7d059'
```

**Note:** The `-var-file` flag is required for both initial and re-import operations to provide the necessary variable values (especially the map keys that route to the correct module instances).

---

## 5. How to Use the Code

### Prerequisites

Ensure you have Terraform (or OpenTofu) installed and AWS credentials configured for account `790543352839` in the `eu-central-1` region.

### Initialize

```bash
terraform init
```

### Plan

To preview changes (using the default environment variables from `environments/sg.tfvars`):

```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output after initial import and reconciliation: **No changes. Your infrastructure matches the configuration.**

### Apply

If changes are desired:

```bash
terraform apply -var-file=environments/sg.tfvars
```

### Targeting Another Environment

The code supports multiple environments via separate `.tfvars` files. To use a different environment (e.g., `dev`, `prod`):

1. **Create a new environment file** by copying the existing one:
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   ```

2. **Edit the new file** with environment-specific values:
   ```hcl
   instances = {
     sg_created_test_instance = {
       ami                    = "ami-xxxxx"  # Different AMI for dev
       instance_type          = "t3.small"   # Different instance type
       # ... other fields
     }
   }
   
   network_interfaces = {
     eni_0fef14b2c7dd7d059 = {
       # ... environment-specific values
     }
   }
   ```

3. **Plan and apply** with the new file:
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   terraform apply -var-file=environments/dev.tfvars
   ```

**No `.tf` edits are required** — all infrastructure variation is controlled via `.tfvars` files.

---

## 6. Variables

### Root Variables

#### `instances`
- **Type:** `map(object({...}))`
- **Required:** No (defaults to `{}`)
- **Description:** Map of EC2 instances to manage. Each key becomes a module instance key.
- **Subfields:**
  - `ami` (string, required): AMI ID to launch
  - `instance_type` (string, required): EC2 instance type
  - `subnet_id` (string, required): VPC subnet for instance placement
  - `vpc_security_group_ids` (list(string), required): Security group IDs
  - `availability_zone` (string, required): AZ for instance
  - `source_dest_check` (bool, optional, default `true`): Enable source/destination checking
  - `ebs_optimized` (bool, optional, default `false`): Enable EBS optimization
  - `monitoring` (bool, optional, default `false`): Enable detailed CloudWatch monitoring
  - `tags` (map(string), optional, default `{}`): Resource tags

#### `network_interfaces`
- **Type:** `map(object({...}))`
- **Required:** No (defaults to `{}`)
- **Description:** Map of standalone network interfaces to manage. Each key becomes a module instance key.
- **Subfields:**
  - `subnet_id` (string, required): VPC subnet for interface placement
  - `security_groups` (list(string), required): Security group IDs
  - `private_ip` (string, optional, default `""`): Static private IP address
  - `source_dest_check` (bool, optional, default `true`): Enable source/destination checking
  - `description` (string, optional, default `""`): Interface description
  - `tags` (map(string), optional, default `{}`): Resource tags

### Sensitive Variables

**None declared.** All variable values in the shipped configuration are non-sensitive. If your deployment requires secrets (e.g., API keys, credentials), define a `secrets.auto.tfvars` file:

```hcl
# secrets.auto.tfvars (do NOT commit to version control)
# Add any sensitive values here if needed in the future
```

This file will be automatically loaded by Terraform if it exists and is in `.gitignore`.

---

## 7. Infrastructure Graph

```
aws_vpc (vpc-0119b9388f2104572)
├── aws_subnet (subnet-0adeb216161049cca)
│   ├── module.instance["sg_created_test_instance"].aws_instance.this
│   │   ├── metadata_options (inlined)
│   │   └── references:
│   │       ├── subnet_id → aws_subnet
│   │       ├── vpc_security_group_ids → aws_security_group (sg-064cbb231ba1bca24)
│   │       └── ami → aws_ami (ami-0ad7e15f9249e8d2f)
│   │
│   └── module.network_interface["eni_0fef14b2c7dd7d059"].aws_network_interface.this
│       ├── subnet_id → aws_subnet
│       ├── security_groups → aws_security_group (sg-064cbb231ba1bca24)
│       └── attachment:
│           └── attached to aws_instance as device_index 0
│
└── aws_security_group (sg-064cbb231ba1bca24, default)
    └── inbound/outbound rules: (managed by security group resource, not here)
```

**Dependency flow:**
- Network interface depends on subnet and security group
- Instance depends on subnet, security group, and (implicitly) the network interface (by virtue of attachment state)
- Both reference the same VPC subnet and security group

---

## 8. Notable Decisions & Caveats

### Network Interface Management

The `aws_network_interface` is managed as a **separate resource** rather than being inlined in the instance definition. This is intentional because:
- The network interface was discovered independently in the cloud
- It is the **primary** interface (device index 0, `DeleteOnTermination=true`)
- Separating the resource provides clearer lifecycle and dependency visibility
- Both resources are in `for_each` loops for scalability

**Note:** Terraform does not have automatic attachment tracking between the instance and the network interface — the attachment state is read from AWS but not managed as a separate relationship in this configuration. Changes to the network interface (e.g., security group reassignment) will not trigger instance replacement.

### Metadata Options

The `metadata_options` block is **explicitly modeled** on the instance to match the discovered state:
- `http_endpoint = "enabled"`
- `http_put_response_hop_limit = 1`
- `http_tokens = "optional"` (allows both v1 and v2 metadata endpoints)
- `http_protocol_ipv6 = "disabled"`
- `instance_metadata_tags = "disabled"`

These settings are stable and will not drift.

### No IAM Instance Profile

The instance has **no IAM instance profile** (null in discovered state). If an instance profile is needed later, it can be added to the `modules/instance/main.tf` via a new variable.

### No Key Pair

The instance has **no key pair** configured (null in discovered state). SSH access cannot be configured via Terraform for an already-running instance. To add key access, the instance would need to be terminated and recreated with the key pair.

### Instance Power State

The instance is in **stopped** state. Terraform does not manage EC2 instance power state (running/stopped/terminated) — only the resource definition. The instance will remain stopped until manually started via the AWS console or CLI.

### Explicit Configuration of Defaults

The following attributes are **explicitly set to their default values** to match discovered state and avoid drift:
- `ebs_optimized = false`
- `monitoring = false`
- `source_dest_check = true` (for both instance and network interface)

### No Lifecycle Rules

No `lifecycle { ignore_changes = [...] }` blocks are needed. All modeled attributes are stable and deterministic from the discovered resource state.

### Private IP Address

The network interface has a **static private IP** (`10.0.0.113`) configured. If the network interface is deleted and recreated, AWS will attempt to assign the same private IP if available in the subnet. To ensure address stability, the configuration explicitly sets `private_ip` in the variable (though it is passed but not used in the current module — this is a known variable that is accepted for future use).

### Empty Outputs at Root

The root `outputs.tf` file is deliberately empty to **avoid the stale-null trap** in Terraform when using `for_each` at the module level. Module outputs are accessible via `module.instance[...].id`, `module.network_interface[...].id`, etc., if needed.

### Clean Plan State

After initial import and reconciliation, the plan shows **0 to add, 0 to change, 0 to destroy**. All discovered resources are now fully represented in code and state.

---

## Summary

This infrastructure-as-code configuration manages two interconnected AWS EC2 resources in `eu-central-1`:
- A t3.micro EC2 instance in the default VPC
- Its primary network interface, managed separately for clarity

The code is production-ready, with a clean reconciliation state and no drift. Use `environments/sg.tfvars` to manage variable values, and deploy new environments by creating additional `.tfvars` files without modifying any `.tf` code.
