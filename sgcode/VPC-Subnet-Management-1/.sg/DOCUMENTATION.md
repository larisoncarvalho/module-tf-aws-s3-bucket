# Terraform/OpenTofu Infrastructure Documentation

## 1. Overview

This Terraform code manages AWS VPC subnet resources in the `ap-southeast-1` region. The infrastructure was generated from discovered cloud resources via the Infra2Code agent and imported into Terraform state until reconciliation showed no drift (0 additions, 0 changes, 0 deletions). The code is now fully synchronized with AWS.

**Key facts:**
- One AWS subnet is currently managed
- Subnet is deployed in the default VPC (`vpc-05fed6e9ac0f64a6e`)
- Region: Asia Pacific (Singapore) — `ap-southeast-1`
- All resources are declared with full state reconciliation

## 2. Resources

| Terraform Address | Provider | Cloud ID | Purpose |
|---|---|---|---|
| `module.subnet["subnet_0aec9ccc3d679b626"].aws_subnet.this` | `aws` | `subnet-0aec9ccc3d679b626` | VPC subnet in ap-southeast-1b, CIDR 172.31.16.0/20, with public IP assignment enabled |

## 3. Module Structure

### Root module (`./`)

**Files:**
- `main.tf` — Declares the `subnet` module instance using `for_each` over `var.subnets` map
- `variables.tf` — Defines `aws_region` and `subnets` input variables
- `providers.tf` — Configures AWS provider with region from `var.aws_region`
- `versions.tf` — Specifies Terraform ≥ 1.5.0 and AWS provider ≥ 5.0
- `outputs.tf` — No outputs defined (module passes through its own)
- `environments/sg.tfvars` — Environment-specific variables for Singapore (sg) environment

**Calling pattern:**
```hcl
module "subnet" {
  source   = "./modules/subnet"
  for_each = var.subnets

  cidr_block              = each.value.cidr_block
  vpc_id                  = each.value.vpc_id
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags                    = each.value.tags
}
```

The `for_each` key matches the discovered subnet's ID (`subnet_0aec9ccc3d679b626`), allowing multiple subnets to be defined via a single map in `tfvars`.

### Module: `modules/subnet/`

**Purpose:** Reusable AWS subnet resource wrapper.

**Files:**
- `main.tf` — Single `aws_subnet` resource named `this`
- `variables.tf` — Inputs: `cidr_block`, `vpc_id`, `availability_zone`, optional `map_public_ip_on_launch` and `tags`
- `outputs.tf` — Exports subnet `id` and `arn`

**Resource:**
```hcl
resource "aws_subnet" "this" {
  cidr_block              = var.cidr_block
  vpc_id                  = var.vpc_id
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags                    = var.tags
}
```

No external (`git::`) modules are used in this codebase.

## 4. How Import Works

The file `imports.sh` contains the import commands executed during initial resource discovery and reconciliation:

```bash
"$1" import -var-file environments/sg.tfvars 'module.subnet["subnet_0aec9ccc3d679b626"].aws_subnet.this' 'subnet-0aec9ccc3d679b626'
```

**What happened:**
1. The Infra2Code agent discovered the subnet `subnet-0aec9ccc3d679b626` in AWS
2. This command imported its state into the Terraform state file at the address `module.subnet["subnet_0aec9ccc3d679b626"].aws_subnet.this`
3. The configuration was generated to match, and `plan` confirmed 0 changes
4. No further import runs are needed

**To re-import a single resource** (if state is lost):
```bash
terraform import -var-file=environments/sg.tfvars \
  'module.subnet["subnet_0aec9ccc3d679b626"].aws_subnet.this' \
  'subnet-0aec9ccc3d679b626'
```

Replace `terraform` with `/tmp/tmp.IigHjH/terraform` if using OpenTofu.

## 5. How to Use the Code

### Prerequisites

- Terraform ≥ 1.5.0 (or OpenTofu ≥ 1.5.0)
- AWS CLI configured with credentials for account `714114208215`
- Appropriate IAM permissions to create/read/update EC2 subnets

### Initialize Terraform

```bash
cd /mnt/sg_workspace/user/global-settings
terraform init
```

### Plan changes

```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output when in sync: **No changes. Your infrastructure matches the configuration.**

### Apply changes

```bash
terraform apply -var-file=environments/sg.tfvars
```

### Targeting another environment

To deploy to a different environment (e.g., production):

1. **Copy and edit the tfvars file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit `environments/prod.tfvars`** to change:
   - `aws_region` if deploying to a different region
   - `subnets` map keys, CIDR blocks, VPC IDs, or AZs as needed

3. **Plan against the new environment:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   ```

4. **Apply:**
   ```bash
   terraform apply -var-file=environments/prod.tfvars
   ```

**No `.tf` files need editing** — all configuration lives in `.tfvars`.

## 6. Variables

### Root-level input variables

#### `aws_region`
- **Type:** `string`
- **Default:** `"ap-southeast-1"`
- **Purpose:** AWS region where subnets are created
- **Sensitive:** No

#### `subnets`
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Purpose:** Map of subnet configurations; each key becomes the `for_each` index
- **Object schema:**
  - `cidr_block` (string, required): CIDR notation for the subnet (e.g., `172.31.16.0/20`)
  - `vpc_id` (string, required): VPC ID to attach the subnet to
  - `availability_zone` (string, required): AWS availability zone (e.g., `ap-southeast-1b`)
  - `map_public_ip_on_launch` (bool, optional, default: `false`): Whether to auto-assign public IPs to instances
  - `tags` (map(string), optional, default: `{}`): Tags to apply to the subnet
- **Sensitive:** No
- **Example** (from `environments/sg.tfvars`):
  ```hcl
  subnets = {
    subnet_0aec9ccc3d679b626 = {
      cidr_block              = "172.31.16.0/20"
      vpc_id                  = "vpc-05fed6e9ac0f64a6e"
      availability_zone       = "ap-southeast-1b"
      map_public_ip_on_launch = true
    }
  }
  ```

### Module-level variables (inherited from root)

The `subnet` module accepts the following inputs (passed via root module):
- `cidr_block` (string, required)
- `vpc_id` (string, required)
- `availability_zone` (string, required)
- `map_public_ip_on_launch` (bool, optional, default: `false`)
- `tags` (map(string), optional, default: `{}`)

### Sensitive variables

**None.** All discovered resources are public network infrastructure with no credential-like values. If credentials are needed in future, create `secrets.auto.tfvars` (excluded from version control) and pass sensitive values via `-var` flags or environment variables (e.g., `TF_VAR_<name>`).

## 7. Infrastructure Graph

```
aws_vpc.vpc-05fed6e9ac0f64a6e (discovered, not managed by this code)
└── module.subnet["subnet_0aec9ccc3d679b626"].aws_subnet.this
    ├── id: subnet-0aec9ccc3d679b626
    ├── cidr_block: 172.31.16.0/20
    ├── availability_zone: ap-southeast-1b
    ├── vpc_id: vpc-05fed6e9ac0f64a6e (reference)
    └── map_public_ip_on_launch: true

aws_network_acl.acl-0b1b4715940488f98 (discovered, not managed by this code)
└── associated with: aws_subnet.this (reverse reference)
```

**Legend:**
- Resources in this code are managed (`aws_subnet.this`)
- Referenced VPC and network ACL are discovered AWS resources not declared in this code (they exist in the account but are not declared in Terraform; they are only referenced by ID)
- No explicit dependencies are managed in the code; the subnet simply specifies the VPC ID it belongs to

## 8. Notable Decisions & Caveats

### Module design
- **Subnet module is simple by design:** Each subnet is a thin wrapper around `aws_subnet`. The module exists to:
  - Allow `for_each` at the root level for scaling to multiple subnets
  - Encapsulate repeated variable declarations
  - Keep subnet configuration centralized in root `tfvars`

### Resource discovery
- **VPC and Network ACL are not managed:** The subnet references `vpc-05fed6e9ac0f64a6e` (the default VPC in the account). This VPC exists in AWS but is not declared in this Terraform code. The same applies to `acl-0b1b4715940488f98` (the default network ACL). These are external resources that may be managed elsewhere or created manually.

### No lifecycle rules
- No `lifecycle { ignore_changes }` blocks are required. All attributes are sourced from the tfvars and discovery data; there is no write-only or computed field drift to suppress.

### Import is one-time
- The `imports.sh` script was run once during initial reconciliation. The state is now fully captured in the local state file. Re-running `imports.sh` is not necessary; use standard `terraform apply` to manage changes.

### Public IP assignment
- The discovered subnet has `map_public_ip_on_launch = true`, meaning any instance launched in this subnet automatically receives a public IPv4 address. This is typical for subnets hosting internet-facing resources. To change this behavior, edit `environments/sg.tfvars`.

### Tags
- The discovered subnet has no tags (`tags: {}`). Additional tags can be added by editing the `subnets` map in `environments/sg.tfvars` without requiring code changes.

### Region lock
- The root module defaults to `ap-southeast-1` (Singapore). To deploy to another region, override `aws_region` in a new `.tfvars` file; the module code itself contains no hardcoded region logic.

### No outputs
- The root module exports no outputs. The subnet module exports `id` and `arn`, but these are not referenced by root. If you need to access the subnet ID or ARN from other Terraform code or scripts, add outputs to `outputs.tf` in the root module.

### Reconciliation status
- Final state reconciliation showed **0 additions, 0 changes, 0 deletions**, confirming that the generated configuration exactly matches the discovered AWS resource. No drift is present.
