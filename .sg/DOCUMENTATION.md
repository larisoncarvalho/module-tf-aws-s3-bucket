# Global Settings Infrastructure Documentation

## 1. Overview

This Terraform/OpenTofu configuration manages AWS VPC Internet Gateways in the `ap-southeast-1` region. The code was generated from discovered cloud resources, automatically imported into state, and reconciled until `plan` showed 0 added / 0 changed / 0 destroyed—meaning the configuration fully reflects the live infrastructure.

The stack consists of:
- **One Internet Gateway** (`igw-02aec4b4978ee2879`) attached to VPC `vpc-05fed6e9ac0f64a6e`
- **Modular architecture** using a reusable `internet_gateway` module called via `for_each` for scalability

## 2. Resources

| Terraform Address | Type | Cloud ID | Real-World Name | Purpose |
|---|---|---|---|---|
| `module.internet_gateway["igw_02aec4b4978ee2879"].aws_internet_gateway.this` | `aws_internet_gateway` | `igw-02aec4b4978ee2879` | Internet Gateway | Provides Internet connectivity for VPC `vpc-05fed6e9ac0f64a6e` |

## 3. Module Structure

### Root Module (`/`)
Located in `/mnt/sg_workspace/user/global-settings/`:
- **`main.tf`** — Declares the `internet_gateway` module, called via `for_each` over `var.internet_gateways` to support multiple gateways
- **`variables.tf`** — Defines `internet_gateways` as a map of objects, each specifying a VPC ID and optional tags
- **`outputs.tf`** — No root-level outputs (scalar passthroughs avoided to keep for_each enumeration clean)
- **`versions.tf`** — Requires AWS provider `>= 4.0`
- **`providers.tf`** — Configures AWS provider for `ap-southeast-1` region

### `modules/internet_gateway/` Module
A reusable, single-responsibility module:
- **`main.tf`** — Defines `aws_internet_gateway.this`, attaching to the provided VPC and applying tags
- **`variables.tf`** — Inputs: `vpc_id` (required, string) and `tags` (optional, map of strings)
- **`outputs.tf`** — Exports: `id` and `arn` of the created Internet Gateway

**Call style from root:**
```hcl
module "internet_gateway" {
  source   = "./modules/internet_gateway"
  for_each = var.internet_gateways

  vpc_id = each.value.vpc_id
  tags   = each.value.tags
}
```

## 4. How Import Works

The `imports.sh` script (located at the root) was used to import the live Internet Gateway into Terraform state:

```bash
#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.internet_gateway["igw_02aec4b4978ee2879"].aws_internet_gateway.this' 'igw-02aec4b4978ee2879'
```

**Execution:**
```bash
bash imports.sh /path/to/terraform
```

This command:
1. Loads variables from `environments/sg.tfvars` to provide the map key
2. Maps the module-qualified Terraform address to the AWS resource ID `igw-02aec4b4978ee2879`
3. Populates `terraform.tfstate` with the resource's attributes from AWS

**Re-importing a single resource** (if state is lost):
```bash
terraform import -var-file environments/sg.tfvars 'module.internet_gateway["igw_02aec4b4978ee2879"].aws_internet_gateway.this' 'igw-02aec4b4978ee2879'
```

The `imports.sh` script need not be run again unless state is deleted or a new resource is discovered.

## 5. How to Use the Code

### Prerequisites
- Terraform or OpenTofu binary available
- AWS credentials configured (via `~/.aws/credentials`, environment variables, or IAM role)
- Working directory: `/mnt/sg_workspace/user/global-settings/`

### Initialize Terraform
```bash
terraform init
```
This downloads the AWS provider (>= 4.0) and prepares the working directory. State is stored locally in `terraform.tfstate` by default.

### Plan Changes
```bash
terraform plan -var-file=environments/sg.tfvars
```
Expected output (current state is reconciled):
```
No changes. Your infrastructure matches the configuration.
```

### Apply Configuration
```bash
terraform apply -var-file=environments/sg.tfvars
```
Since no changes are needed, this will complete instantly. If any resource drift is detected later, apply will reconcile it.

### Targeting Another Environment
To manage Internet Gateways in a different account or region:

1. **Create a new environment file** (e.g., `environments/prod.tfvars`):
   ```hcl
   internet_gateways = {
     igw_prod_gateway = {
       vpc_id = "vpc-abc123def456"
       tags = {
         Environment = "prod"
         Managed     = "terraform"
       }
     }
   }
   ```

2. **Plan for the new environment:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   ```

3. **Apply if satisfied:**
   ```bash
   terraform apply -var-file=environments/prod.tfvars
   ```

**Note:** No `.tf` files require editing. All infrastructure variations are driven by the variables file.

## 6. Variables

### `internet_gateways`
- **Type:** `map(object({ vpc_id = string, tags = optional(map(string), {}) }))`
- **Default:** `{}`
- **Description:** Map of Internet Gateways to create. Each key is a logical identifier (e.g., `igw_02aec4b4978ee2879`), and each value specifies the VPC to attach to and optional tags.
- **Example:**
  ```hcl
  internet_gateways = {
    igw_02aec4b4978ee2879 = {
      vpc_id = "vpc-05fed6e9ac0f64a6e"
      tags = {
        Name        = "main-igw"
        Environment = "sg"
      }
    }
  }
  ```

### Sensitive Variables
**None.** No secrets, API keys, or write-only attributes are required for this configuration. All values are stored in version-controllable `.tfvars` files.

## 7. Infrastructure Graph

```
aws_vpc
└── vpc-05fed6e9ac0f64a6e
    └── aws_internet_gateway
        ├── igw-02aec4b4978ee2879 (attached)
        │   └── module.internet_gateway["igw_02aec4b4978ee2879"]
        │       └── aws_internet_gateway.this
```

**Dependency Flow:**
- Internet Gateway depends on VPC ID (provided as input)
- No reverse dependencies: the gateway is standalone in this configuration

## 8. Notable Decisions & Caveats

### Module Design
- **for_each over count:** The root module uses `for_each` instead of `count` for calling `internet_gateway`, allowing map keys (e.g., `igw_02aec4b4978ee2879`) to serve as human-readable identifiers that remain stable even if the configuration is reordered.

### No lifecycle { ignore_changes }
- All attributes are managed by Terraform; no drift is intentionally ignored.

### Empty Tags
- The imported Internet Gateway has no tags. Tags can be added by updating `environments/sg.tfvars` and re-applying.

### No Root Outputs
- The root module exports no outputs. Module outputs (`id`, `arn`) are accessible via `module.internet_gateway["igw_02aec4b4978ee2879"].id` and `.arn` if needed in consumer modules.

### Single Region
- Provider is hardcoded to `ap-southeast-1`. To manage resources in other regions, either create a separate stack or add provider alias logic and `provider` arguments to module calls.

### Computed Attributes Not Exposed
- The `aws_internet_gateway` resource includes computed attributes (e.g., `owner_id`, `attachments` list). These are not exported by the module; if needed, either update the module's `outputs.tf` or reference them directly as `module.internet_gateway["key"].aws_internet_gateway.this.attachments`.

### No Subnet/Route Table Integration
- This stack manages only the Internet Gateway itself. To be useful, the gateway must be added to route tables. This can be done via a separate `aws_route` or `aws_route_table_association` resource/module in a consumer configuration.

### Plan is Clean (0/0/0)
- The imported state matches the configuration exactly. No drift, no pending changes.
