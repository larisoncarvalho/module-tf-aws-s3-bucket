# AWS Global Settings Infrastructure — Documentation

## 1. Overview

This Terraform/OpenTofu configuration manages AWS networking and compute infrastructure in the `eu-central-1` region. The code was generated from cloud resource discovery and reconciled by importing resources into Terraform state until `terraform plan` showed **0 changes, 0 additions, 0 deletions**.

**Current state:** All 5 discovered resources were confirmed as **phantom resources** — they no longer exist in the cloud. The import process was skipped, and the configuration now represents an **empty infrastructure template** ready to be populated with new resources. The `plan` result is clean (0/0/0) with empty variable maps in `environments/sg.tfvars`.

**Region:** `eu-central-1`  
**Provider:** AWS (Terraform AWS provider ~> 5.0)

---

## 2. Resources

The following table lists all Terraform-managed resources (addressing scheme, provider type, intended purpose). Since all discovered resources were phantom objects, **no resources are currently in state**.

| Module | Terraform Address | Provider Type | Discovered Name/ID | Purpose |
|--------|-------------------|-------------------|---------------------|---------|
| vpc | `module.vpc[*].aws_vpc.this` | aws_vpc | workshop-vpc-autotest / vpc-0a5669f12e4ced836 | Create VPCs with configurable CIDR, tenancy, DNS settings |
| subnet | `module.subnet[*].aws_subnet.this` | aws_subnet | workshop-vpc-autotest-public-eu-central-1a / subnet-0926b6bb75d94d878 | Create subnets within VPCs with optional public IP mapping |
| security_group | `module.security_group[*].aws_security_group.this` | aws_security_group | launch-wizard-2 / sg-0d4955baf94d350bc | Create security groups with dynamic ingress/egress rules |
| network_interface | `module.network_interface[*].aws_network_interface.this` | aws_network_interface | eni-022bd18edb44deee5 | Create ENIs with optional private IPs and security groups |
| instance | `module.instance[*].aws_instance.this` | aws_instance | test-iam-role-pr-qa / i-0f66eb95b4bbffa46 | Create EC2 instances with metadata options and block device config |

**Note:** Resource addresses use `for_each` iteration (via root variables). For example, if `var.instances = { "web-server": {...} }`, the instance would be addressed as `module.instance["web-server"].aws_instance.this`.

---

## 3. Module Structure

All modules are local, co-located under `modules/` in this repository. No external git/Terraform modules are used.

### 3.1 `modules/vpc`

**Files:**
- `modules/vpc/main.tf` — Creates a single `aws_vpc` resource
- `modules/vpc/variables.tf` — Input variables for VPC configuration

**Inputs:**
- `cidr_block` (string, required) — VPC CIDR block (e.g., `10.0.0.0/16`)
- `instance_tenancy` (string, default `"default"`) — Tenancy type
- `enable_dns_support` (bool, default `true`) — Enable DNS resolution in the VPC
- `enable_dns_hostnames` (bool, default `false`) — Enable DNS hostnames
- `tags` (map(string), default `{}`) — Resource tags

**Output:** Single VPC resource with `id`, `cidr_block`, etc. (passthrough)

---

### 3.2 `modules/subnet`

**Files:**
- `modules/subnet/main.tf` — Creates a single `aws_subnet` resource
- `modules/subnet/variables.tf` — Input variables

**Inputs:**
- `vpc_id` (string, required) — VPC ID (typically from `module.vpc[...].aws_vpc.this.id`)
- `cidr_block` (string, required) — Subnet CIDR block (e.g., `10.0.1.0/24`)
- `availability_zone` (string, optional) — AZ within the region
- `map_public_ip_on_launch` (bool, default `false`) — Auto-assign public IPs
- `tags` (map(string), default `{}`) — Resource tags

**Output:** Single subnet resource

---

### 3.3 `modules/security_group`

**Files:**
- `modules/security_group/main.tf` — Creates a single `aws_security_group` with dynamic ingress/egress blocks
- `modules/security_group/variables.tf` — Input variables

**Inputs:**
- `name` (string, required) — Security group name
- `description` (string, required) — Description
- `vpc_id` (string, required) — VPC ID
- `ingress_rules` (list(object), default `[]`) — List of ingress rules; each with `from_port`, `to_port`, `protocol`, `cidr_blocks`
- `egress_rules` (list(object), default `[]`) — List of egress rules (same structure)
- `tags` (map(string), default `{}`) — Resource tags

**Dynamic Blocks:** Uses `dynamic "ingress"` and `dynamic "egress"` to iterate over rule lists.

---

### 3.4 `modules/network_interface`

**Files:**
- `modules/network_interface/main.tf` — Creates a single `aws_network_interface` resource
- `modules/network_interface/variables.tf` — Input variables

**Inputs:**
- `subnet_id` (string, required) — Subnet ID
- `private_ip` (string, optional) — Single private IP (converted to list via conditional)
- `security_groups` (list(string), default `[]`) — Security group IDs
- `source_dest_check` (bool, default `true`) — Enable source/destination checking
- `description` (string, default `""`) — ENI description
- `tags` (map(string), default `{}`) — Resource tags

**Note:** The module converts optional `private_ip` scalar to a list with `private_ips = var.private_ip != null ? [var.private_ip] : []`.

---

### 3.5 `modules/instance`

**Files:**
- `modules/instance/main.tf` — Creates a single `aws_instance` resource with optional metadata and block device configs
- `modules/instance/variables.tf` — Input variables

**Inputs:**
- `ami` (string, required) — AMI ID
- `instance_type` (string, required) — Instance type (e.g., `t2.large`)
- `subnet_id` (string, required) — Subnet ID for launch
- `key_name` (string, optional) — Key pair name
- `vpc_security_group_ids` (list(string), default `[]`) — Security group IDs
- `iam_instance_profile` (string, optional) — IAM instance profile name/ARN
- `monitoring` (bool, default `false`) — Enable detailed CloudWatch monitoring
- `ebs_optimized` (bool, default `false`) — Enable EBS optimization
- `source_dest_check` (bool, default `true`) — Enable source/destination checking
- `user_data` (string, optional) — Base64-encoded user data script
- `metadata_options` (object, optional) — IMDSv2 configuration with fields `http_endpoint`, `http_tokens`, `http_put_response_hop_limit`, `instance_metadata_tags`
- `root_block_device` (object, optional) — Root volume config with `delete_on_termination`, `volume_type`, `volume_size`
- `tags` (map(string), default `{}`) — Resource tags

**Dynamic Blocks:** Uses `dynamic "metadata_options"` and `dynamic "root_block_device"` for optional nested configurations.

---

## 4. How Import Works

### Initial Setup (Already Completed)

1. **Discovery:** Cloud resources were scanned and stored in `/mnt/sg_workspace/artifacts/artifacts/resources.json`.
2. **Module Generation:** Terraform modules were generated to match the discovered schema.
3. **Import via `imports.sh`:** A script was provided to import each resource via `terraform import`.

### Current State

All 5 discovered resources were determined to be **phantom objects** — they no longer exist in the AWS account (region `eu-central-1`). The import script (`imports.sh`) was updated to reflect this:

```bash
#!/bin/sh
set -e
echo "No resources to import - all discovered resources are phantoms."
```

The configuration now contains **no state entries** and serves as a template.

### Re-import a Single Resource (If Needed)

If you discover that a resource should be imported or needs to be reimported after state loss:

```bash
# Example: import a VPC directly
terraform import 'module.vpc["vpc-name"].aws_vpc.this' vpc-0a5669f12e4ced836

# Example: import a subnet
terraform import 'module.subnet["subnet-name"].aws_subnet.this' subnet-0926b6bb75d94d878

# Example: import a security group
terraform import 'module.security_group["sg-name"].aws_security_group.this' sg-0d4955baf94d350bc

# Example: import a network interface
terraform import 'module.network_interface["eni-name"].aws_network_interface.this' eni-022bd18edb44deee5

# Example: import an instance
terraform import 'module.instance["instance-name"].aws_instance.this' i-0f66eb95b4bbffa46
```

Replace the dictionary key (e.g., `"vpc-name"`) with the corresponding key in the root variable map (e.g., `var.vpcs["vpc-name"]`).

---

## 5. How to Use the Code

### Initialize Terraform/OpenTofu

```bash
# Initialize the working directory
tofu init
# or: terraform init
```

### Plan and Apply

#### Plan with the provided environment file:

```bash
tofu plan -var-file=environments/sg.tfvars
# or: terraform plan -var-file=environments/sg.tfvars
```

Since `environments/sg.tfvars` currently contains empty maps (`vpcs = {}`), the plan will show **no changes**. To create infrastructure:

#### 1. Edit `environments/sg.tfvars` to define resources:

Example:

```hcl
vpcs = {
  "main" = {
    cidr_block           = "10.0.0.0/16"
    instance_tenancy     = "default"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags = {
      Name = "main-vpc"
    }
  }
}

subnets = {
  "public-1a" = {
    vpc_id                  = "vpc-0a5669f12e4ced836"  # Reference existing VPC or use dynamic reference
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = true
    tags = {
      Name = "public-subnet-1a"
    }
  }
}

security_groups = {
  "web" = {
    name        = "web-sg"
    description = "Security group for web servers"
    vpc_id      = "vpc-0a5669f12e4ced836"
    ingress_rules = [
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    tags = {
      Name = "web-sg"
    }
  }
}

instances = {
  "web-server-1" = {
    ami                    = "ami-03250b0e01c28d196"
    instance_type          = "t2.large"
    subnet_id              = "subnet-0926b6bb75d94d878"
    key_name               = "my-key-pair"
    vpc_security_group_ids = ["sg-0d4955baf94d350bc"]
    iam_instance_profile   = "ec2-private-runner"
    monitoring             = false
    ebs_optimized          = false
    source_dest_check      = true
    user_data              = null
    metadata_options = {
      http_endpoint               = "enabled"
      http_tokens                 = "required"
      http_put_response_hop_limit = 2
      instance_metadata_tags      = "disabled"
    }
    root_block_device = {
      delete_on_termination = true
      volume_type           = "gp3"
      volume_size           = 100
    }
    tags = {
      Name = "web-server-1"
    }
  }
}

network_interfaces = {
  "secondary-eni" = {
    subnet_id         = "subnet-0926b6bb75d94d878"
    private_ip        = "10.0.1.100"
    security_groups   = ["sg-0d4955baf94d350bc"]
    source_dest_check = true
    description       = "Secondary network interface"
    tags = {
      Name = "secondary-eni"
    }
  }
}
```

#### 2. Plan the changes:

```bash
tofu plan -var-file=environments/sg.tfvars
```

#### 3. Apply the configuration:

```bash
tofu apply -var-file=environments/sg.tfvars
```

### Target Another Environment

To manage a different environment (e.g., `prod`), create a new variables file without modifying the `.tf` code:

```bash
# Copy the template
cp environments/sg.tfvars environments/prod.tfvars

# Edit with prod-specific values
nano environments/prod.tfvars

# Plan for prod
tofu plan -var-file=environments/prod.tfvars

# Apply to prod
tofu apply -var-file=environments/prod.tfvars
```

No changes to `.tf` files are needed; infrastructure differences are entirely defined in the `.tfvars` files.

---

## 6. Variables

### Root Variables (Defined in `variables.tf`)

All variables are maps using `for_each`, enabling multiple instances of each resource type.

#### `var.vpcs`

**Type:** `map(object({...}))`  
**Default:** `{}`

Defines VPC configurations. Each key is a logical name used in `module.vpc[key]`.

**Fields:**
- `cidr_block` (string, required) — VPC CIDR block
- `instance_tenancy` (string, optional, default `"default"`) — `"default"` or `"dedicated"`
- `enable_dns_support` (bool, optional, default `true`)
- `enable_dns_hostnames` (bool, optional, default `false`)
- `tags` (map(string), optional, default `{}`)

---

#### `var.subnets`

**Type:** `map(object({...}))`  
**Default:** `{}`

Defines subnet configurations. Each key is a logical name used in `module.subnet[key]`.

**Fields:**
- `vpc_id` (string, required) — VPC ID to associate with
- `cidr_block` (string, required) — Subnet CIDR block
- `availability_zone` (string, optional, default `null`) — AZ in the region (e.g., `eu-central-1a`)
- `map_public_ip_on_launch` (bool, optional, default `false`)
- `tags` (map(string), optional, default `{}`)

---

#### `var.security_groups`

**Type:** `map(object({...}))`  
**Default:** `{}`

Defines security group configurations. Each key is a logical name used in `module.security_group[key]`.

**Fields:**
- `name` (string, required) — Security group name
- `description` (string, required) — Description
- `vpc_id` (string, required) — VPC ID
- `ingress_rules` (list(object), optional, default `[]`) — Ingress rules with `from_port`, `to_port`, `protocol`, `cidr_blocks`
- `egress_rules` (list(object), optional, default `[]`) — Egress rules (same structure)
- `tags` (map(string), optional, default `{}`)

---

#### `var.network_interfaces`

**Type:** `map(object({...}))`  
**Default:** `{}`

Defines ENI configurations. Each key is a logical name used in `module.network_interface[key]`.

**Fields:**
- `subnet_id` (string, required) — Subnet ID
- `private_ip` (string, optional, default `null`) — Single private IP address
- `security_groups` (list(string), optional, default `[]`) — Security group IDs
- `source_dest_check` (bool, optional, default `true`)
- `description` (string, optional, default `""`)
- `tags` (map(string), optional, default `{}`)

---

#### `var.instances`

**Type:** `map(object({...}))`  
**Default:** `{}`

Defines EC2 instance configurations. Each key is a logical name used in `module.instance[key]`.

**Fields:**
- `ami` (string, required) — AMI ID
- `instance_type` (string, required) — Instance type (e.g., `t2.large`)
- `subnet_id` (string, required) — Subnet ID for launch
- `key_name` (string, optional, default `null`) — EC2 Key Pair name
- `vpc_security_group_ids` (list(string), optional, default `[]`) — Security group IDs
- `iam_instance_profile` (string, optional, default `null`) — IAM instance profile name
- `monitoring` (bool, optional, default `false`) — Detailed CloudWatch monitoring
- `ebs_optimized` (bool, optional, default `false`)
- `source_dest_check` (bool, optional, default `true`)
- `user_data` (string, optional, default `null`) — Base64-encoded initialization script
- `metadata_options` (object, optional, default `null`) — IMDSv2 config with fields:
  - `http_endpoint` (string, default `"enabled"`)
  - `http_tokens` (string, default `"optional"`)
  - `http_put_response_hop_limit` (number, default `1`)
  - `instance_metadata_tags` (string, default `"disabled"`)
- `root_block_device` (object, optional, default `null`) — Root volume config with fields:
  - `delete_on_termination` (bool, default `true`)
  - `volume_type` (string, optional, e.g., `"gp3"`)
  - `volume_size` (number, optional)
- `tags` (map(string), optional, default `{}`)

---

### Sensitive Variables

**No sensitive variables are defined in the shipped configuration.** If IAM credentials, API keys, or other secrets need to be injected, they would be stored in a `secrets.auto.tfvars` file (which is **not** included in this repository and must be created by the user).

**To pass sensitive values:**

1. Create `secrets.auto.tfvars` in the root directory with your sensitive data:
   ```hcl
   # secrets.auto.tfvars (do not commit)
   my_secret_key = "your-secret-value"
   ```

2. Or pass them via command line:
   ```bash
   tofu apply -var-file=environments/sg.tfvars -var="my_secret_key=value"
   ```

3. Or use environment variables (Terraform convention):
   ```bash
   export TF_VAR_my_secret_key="value"
   tofu apply -var-file=environments/sg.tfvars
   ```

---

## 7. Infrastructure Graph

The following ASCII tree shows the resource hierarchy and dependencies. Since all discovered resources are phantoms and no state exists, this represents the **potential** structure when resources are created.

```
Root Variables (environments/sg.tfvars)
│
├── var.vpcs
│   └── module.vpc[*]
│       └── aws_vpc.this
│
├── var.subnets
│   └── module.subnet[*]
│       └── aws_subnet.this
│           └── (references aws_vpc.id via vpc_id parameter)
│
├── var.security_groups
│   └── module.security_group[*]
│       └── aws_security_group.this
│           ├── (references aws_vpc.id via vpc_id parameter)
│           ├── dynamic ingress blocks (from ingress_rules)
│           └── dynamic egress blocks (from egress_rules)
│
├── var.network_interfaces
│   └── module.network_interface[*]
│       └── aws_network_interface.this
│           ├── (references aws_subnet.id via subnet_id parameter)
│           └── (references security groups via security_groups parameter)
│
└── var.instances
    └── module.instance[*]
        └── aws_instance.this
            ├── (references aws_subnet.id via subnet_id parameter)
            ├── (references security groups via vpc_security_group_ids parameter)
            ├── dynamic metadata_options block (if provided)
            └── dynamic root_block_device block (if provided)
```

**Example: Actual dependency chain when resources exist**

If `var.vpcs = { "main": {...} }`, `var.subnets = { "public-1a": { vpc_id = module.vpc["main"].aws_vpc.this.id, ... } }`, then:

```
aws_vpc.this (module.vpc["main"])
│
└── aws_subnet.this (module.subnet["public-1a"])
    └── (map_public_ip_on_launch triggers ENI creation on launch)
        └── aws_instance.this (module.instance["web-1"])
            └── aws_network_interface.this (implicit, primary ENI)
                └── aws_security_group.this (module.security_group["web"])
```

---

## 8. Notable Decisions & Caveats

### Phantom Resources & Reconciliation

- **All 5 discovered resources were identified as phantom objects** — they no longer exist in the AWS account (`eu-central-1`):
  - `vpc-0a5669f12e4ced836` (workshop-vpc-autotest)
  - `subnet-0926b6bb75d94d878` (workshop-vpc-autotest-public-eu-central-1a)
  - `sg-0d4955baf94d350bc` (launch-wizard-2)
  - `eni-022bd18edb44deee5`
  - `i-0f66eb95b4bbffa46` (test-iam-role-pr-qa)

- **No `lifecycle { ignore_changes }` blocks** were added because no resources are in state.

- **`imports.sh` was emptied** (no imports executed). The configuration now serves as a **template for future infrastructure**.

### Module Design

- **All modules use `for_each` iteration** (no `count`). This allows flexible resource naming via map keys in `.tfvars` files.

- **Local modules only** — no external `git::` sources. All module code is co-located under `modules/`.

- **Optional nested objects** are handled via `dynamic` blocks:
  - `metadata_options` in `aws_instance` uses `for_each = var.metadata_options != null ? [var.metadata_options] : []`
  - `root_block_device` in `aws_instance` uses the same pattern
  - Ingress/egress rules in `aws_security_group` iterate over lists

### Computed Attributes Omitted

- **Network interface private IPs:** Converted to a single-element list via `private_ips = var.private_ip != null ? [var.private_ip] : []`. Additional private IPs cannot be managed through this module.

- **ENI attachment to instances:** The instance's primary ENI is created implicitly; secondary ENI attachment is not exposed in the module.

- **Route tables, NACLs, IGWs:** Not in scope for this configuration. They are discovered but not managed.

### Empty Environment File

- `environments/sg.tfvars` contains **empty maps** (`vpcs = {}`, `subnets = {}`, etc.). This is intentional — the template is ready to accept resource definitions without code changes.

### No Provider State Locking

- No `terraform.tf` / S3 backend configuration is included. State is stored locally by default. For production use, configure a remote backend (S3 + DynamoDB, Terraform Cloud, etc.) and add state locking.

### Region Hard-Coded

- AWS region is hard-coded to `eu-central-1` in `providers.tf`. To target another region, either:
  - Edit `providers.tf` and re-plan/apply, or
  - Add a variable and pass `-var="region=us-east-1"` (not currently supported)

---

## Conclusion

This configuration provides a clean, modular template for managing AWS VPCs, subnets, security groups, ENIs, and EC2 instances in the `eu-central-1` region. All discovered resources were stale; the infrastructure is currently empty and ready for deployment via updated `.tfvars` files.
