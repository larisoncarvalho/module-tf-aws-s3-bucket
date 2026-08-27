# Terraform Global Settings Infrastructure Documentation

## 1. Overview

This Terraform codebase manages **global AWS cloud settings and foundational resources** across multiple regions (primary: `ap-southeast-1`, secondary: `eu-central-1` and `us-west-1`). 

**Reconciliation Status:** ✅ **Complete** — Infrastructure discovered from live AWS account, code generated, and all resources imported into Terraform state. Final `plan` output showed `0 added, 0 changed, 0 destroyed` — infrastructure fully aligned with configuration.

**Key Characteristics:**
- **Multi-region deployments** via AWS provider aliases (`ap-southeast-1`, `eu-central-1`, `us-west-1`)
- **Service-linked and utility IAM roles** for AWS services (EFS, API Gateway, SageMaker, Support)
- **Managed IAM policies** including unrestricted admin policy and SageMaker/Cognito service policies
- **Default VPC infrastructure** (default VPC, subnets, Internet Gateway, route table, security group, NACL)
- **Apache Cassandra Keyspaces** (managed data stores) across three regions
- **Athena Workgroup** for SQL query execution over S3 data
- **CloudFormation Stack** (metadata only; body managed externally)

## 2. Resources

| Terraform Address | Resource Type | Cloud ID / Name | Purpose |
|---|---|---|---|
| `module.athena_workgroup.aws_athena_workgroup.this` | `aws_athena_workgroup` | `primary` | Query execution environment for Athena SQL queries over S3 |
| `module.cloudformation_stack.aws_cloudformation_stack.this` | `aws_cloudformation_stack` | `arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/...` | CloudFormation stack metadata (template managed externally) |
| `module.iam_policy["all"].aws_iam_policy.this` | `aws_iam_policy` | `arn:aws:iam::714114208215:policy/All` | Admin policy: Allow all actions on all resources (`"Action": "*"`) |
| `module.iam_policy["amazonsagemaker_executionpolicy_20231125t142640"].aws_iam_policy.this` | `aws_iam_policy` | `arn:aws:iam::714114208215:policy/service-role/AmazonSageMaker-ExecutionPolicy-...` | SageMaker execution policy: S3 object and bucket operations |
| `module.iam_policy["amazonsagemakerservicecatalogproductsuserole_20231125t142608"].aws_iam_policy.this` | `aws_iam_policy` | `arn:aws:iam::714114208215:policy/service-role/AmazonSageMakerServiceCatalogProductsUseRole-...` | SageMaker Service Catalog policy: CloudFormation, CodeBuild, CodeCommit, CodePipeline, ECR, Glue, Lambda, etc. |
| `module.iam_policy["aws_iam_policy_4"].aws_iam_policy.this` | `aws_iam_policy` | `arn:aws:iam::714114208215:policy/service-role/Cognito-1690255817691` | Cognito policy: SNS publish permissions |
| `module.iam_role["awsserviceroleforamazonelasticfilesystem"].aws_iam_role.this` | `aws_iam_role` | `AWSServiceRoleForAmazonElasticFileSystem` | Service-linked role for AWS EFS (managed by AWS) |
| `module.iam_role["awsserviceroleforapigateway"].aws_iam_role.this` | `aws_iam_role` | `AWSServiceRoleForAPIGateway` | Service-linked role for AWS API Gateway (managed by AWS) |
| `module.iam_role["awsserviceroleforamazonsagemakernotebooks"].aws_iam_role.this` | `aws_iam_role` | `AWSServiceRoleForAmazonSageMakerNotebooks` | Service-linked role for SageMaker Notebooks (managed by AWS) |
| `module.iam_role["awsserviceroleforsupport"].aws_iam_role.this` | `aws_iam_role` | `AWSServiceRoleForSupport` | Service-linked role for AWS Support (managed by AWS) |
| `module.default_vpc.aws_default_vpc.this` | `aws_default_vpc` | `vpc-05fed6e9ac0f64a6e` | Default VPC for region `ap-southeast-1` |
| `module.internet_gateway.aws_internet_gateway.this` | `aws_internet_gateway` | `igw-02aec4b4978ee2879` | Internet Gateway attached to default VPC |
| `module.default_subnet["aws_subnet_1"].aws_default_subnet.this` | `aws_default_subnet` | `subnet-0aec9ccc3d679b626` (AZ: `ap-southeast-1b`) | Default public subnet in AZ 1b |
| `module.default_subnet["aws_subnet_2"].aws_default_subnet.this` | `aws_default_subnet` | `subnet-0df3e594471580676` (AZ: `ap-southeast-1a`) | Default public subnet in AZ 1a |
| `module.security_group["security_group_for_outbound_nfs_d_e7rysy0e6m17"].aws_security_group.this` | `aws_security_group` | `sg-09b139379252db92a` | **Phantom resource** (no longer exists in cloud; excluded from state) |
| `module.default_security_group.aws_default_security_group.this` | `aws_default_security_group` | `sg-0b58b33cabde6d297` | Default security group for VPC; ingress: self-referencing, egress: 0.0.0.0/0 |
| `module.security_group["security_group_for_inbound_nfs_d_e7rysy0e6m17"].aws_security_group.this` | `aws_security_group` | `sg-0c5fca3d0f618a860` | **Phantom resource** (no longer exists in cloud; excluded from state) |
| `module.route_table.aws_route_table.this` | `aws_route_table` | `rtb-011310e36ec8c4564` | Route table with default route to IGW (0.0.0.0/0 → igw-02aec4b4978ee2879) |
| `module.default_network_acl.aws_default_network_acl.this` | `aws_default_network_acl` | `acl-0b1b4715940488f98` | Default Network ACL; inbound/outbound: allow all traffic (protocol `-1`) |
| `module.keyspaces_ap_southeast_1["system"].aws_keyspaces_keyspace.this` | `aws_keyspaces_keyspace` | `system` (region: `ap-southeast-1`) | Apache Cassandra Keyspace "system" (SINGLE_REGION replication) |
| `module.keyspaces_ap_southeast_1["system_schema_mcs"].aws_keyspaces_keyspace.this` | `aws_keyspaces_keyspace` | `system_schema_mcs` (region: `ap-southeast-1`) | Apache Cassandra Keyspace "system_schema_mcs" (SINGLE_REGION replication) |
| `module.keyspaces_eu_central_1["system"].aws_keyspaces_keyspace.this` | `aws_keyspaces_keyspace` | `system` (region: `eu-central-1`) | Apache Cassandra Keyspace "system" (SINGLE_REGION replication) |
| `module.keyspaces_eu_central_1["system_multiregion_info"].aws_keyspaces_keyspace.this` | `aws_keyspaces_keyspace` | `system_multiregion_info` (region: `eu-central-1`) | Apache Cassandra Keyspace "system_multiregion_info" (SINGLE_REGION replication) |
| `module.keyspaces_us_west_1["system_schema_mcs"].aws_keyspaces_keyspace.this` | `aws_keyspaces_keyspace` | `system_schema_mcs` (region: `us-west-1`) | Apache Cassandra Keyspace "system_schema_mcs" (SINGLE_REGION replication) |

**Total managed resources:** 22 (including phantom SGs that are excluded from state but appear in config)

## 3. Module Structure

### Root Configuration (`/`)
- **`main.tf`** — Module instantiations for all 13 modules
- **`variables.tf`** — Root-level input variables for all modules
- **`outputs.tf`** — Outputs for key resources (workgroup ID, stack ID, VPC ID, IGW ID, route table ID, NACL ID, SG ID)
- **`providers.tf`** — AWS provider configuration with 4 aliases: `default` (ap-southeast-1), `eu_central_1`, `us_west_1`, `global` (us-east-1)
- **`versions.tf`** — Terraform >= 1.3.0, AWS provider >= 5.0.0

### Modules (under `modules/`)

#### `athena_workgroup/`
- **Resource:** `aws_athena_workgroup.this`
- **Variables:**
  - `name` (string, default: `"primary"`)
  - `description` (string, default: `""`)
  - `state` (string, default: `"ENABLED"`)
  - `enforce_workgroup_configuration` (bool, default: `false`)
  - `publish_cloudwatch_metrics_enabled` (bool, default: `true`)
  - `requester_pays_enabled` (bool, default: `false`)
- **Purpose:** Defines Athena query workgroup configuration

#### `cloudformation_stack/`
- **Resource:** `aws_cloudformation_stack.this`
- **Variables:**
  - `name` (string, default: `"stulyze-app"`)
  - `disable_rollback` (bool, default: `false`)
- **Lifecycle:** `ignore_changes` on `[template_body, template_url, parameters, capabilities, on_failure, timeout_in_minutes, notification_arns, policy_body, policy_url, iam_role_arn, tags]` — Terraform imports only metadata; template body is managed externally
- **Purpose:** Manages CloudFormation stack metadata

#### `iam_policy/`
- **Resource:** `aws_iam_policy.this`
- **Call Style:** `for_each` on `var.iam_policies` map
- **Variables:**
  - `name` (string)
  - `path` (string, optional, default: `"/"`)
  - `description` (string, optional)
  - `policy` (string) — JSON policy document
- **Purpose:** Generic module for creating IAM policies

#### `iam_role/`
- **Resource:** `aws_iam_role.this`
- **Call Style:** `for_each` on `var.iam_roles` map
- **Variables:**
  - `name` (string)
  - `path` (string, optional, default: `"/"`)
  - `description` (string, optional)
  - `assume_role_policy` (string) — JSON trust policy
  - `max_session_duration` (number, optional, default: `3600`)
- **Lifecycle:** `ignore_changes = [inline_policy]` — Service-linked roles have AWS-managed inline policies not readable by Terraform post-import
- **Purpose:** Generic module for creating IAM roles (primarily service-linked roles)

#### `default_vpc/`
- **Resource:** `aws_default_vpc.this`
- **Variables:** `tags` (optional map)
- **Purpose:** Adopts the AWS default VPC into Terraform management

#### `internet_gateway/`
- **Resource:** `aws_internet_gateway.this`
- **Variables:**
  - `vpc_id` (string) — VPC to attach IGW to
  - `tags` (optional map)
- **Purpose:** Creates/manages Internet Gateway

#### `default_subnet/`
- **Resource:** `aws_default_subnet.this`
- **Call Style:** `for_each` on `var.default_subnets` map
- **Variables:**
  - `availability_zone` (string) — AZ for the subnet
  - `map_public_ip_on_launch` (bool, optional, default: `true`)
  - `tags` (optional map)
- **Purpose:** Adopts default subnets into Terraform management

#### `security_group/`
- **Resource:** `aws_security_group.this`
- **Call Style:** `for_each` on `var.security_groups` map
- **Variables:**
  - `name` (string)
  - `description` (string, optional)
  - `vpc_id` (string)
  - `ingress` (list of ingress rules with from_port, to_port, protocol, cidr_blocks, self, security_groups, description)
  - `egress` (list of egress rules, same structure)
  - `tags` (optional map)
- **Purpose:** Creates security groups with dynamic ingress/egress rules

#### `default_security_group/`
- **Resource:** `aws_default_security_group.this`
- **Variables:**
  - `vpc_id` (string) — VPC for the default SG
  - `ingress` (list of rules, same structure as security_group)
  - `egress` (list of rules, same structure as security_group)
  - `tags` (optional map)
- **Purpose:** Manages the default security group for a VPC

#### `route_table/`
- **Resource:** `aws_route_table.this`
- **Variables:**
  - `vpc_id` (string)
  - `routes` (list of route specs: cidr_block, ipv6_cidr_block, gateway_id, nat_gateway_id, network_interface_id, transit_gateway_id, vpc_peering_connection_id, egress_only_gateway_id)
  - `tags` (optional map)
- **Purpose:** Creates and manages route tables with dynamic routes

#### `network_acl/` (named `default_network_acl` in root)
- **Resource:** `aws_network_acl.this` (note: module is named `network_acl` but in root config it's used as `default_network_acl`)
- **Variables:**
  - `vpc_id` (string)
  - `subnet_ids` (list of subnet IDs)
  - `ingress` (list of ingress rules: rule_no, action, protocol, cidr_block, from_port, to_port)
  - `egress` (list of egress rules, same structure)
  - `tags` (optional map)
- **Purpose:** Generic module for creating Network ACLs (or adopting default NACL)

#### `keyspaces_keyspace/`
- **Resource:** `aws_keyspaces_keyspace.this`
- **Call Style:** `for_each` (instantiated 3 times at root with different provider aliases)
- **Variables:**
  - `name` (string) — Keyspace name
  - `replication_strategy` (string, optional, default: `"SINGLE_REGION"`)
  - `tags` (optional map)
- **Purpose:** Creates Apache Cassandra Keyspaces in Amazon Keyspaces service

**Multi-region deployment pattern for Keyspaces:**
```hcl
module "keyspaces_ap_southeast_1" {
  source   = "./modules/keyspaces_keyspace"
  for_each = var.keyspaces_ap_southeast_1
  # default provider: ap-southeast-1
}

module "keyspaces_eu_central_1" {
  source   = "./modules/keyspaces_keyspace"
  for_each = var.keyspaces_eu_central_1
  providers = { aws = aws.eu_central_1 }  # alias provider
}

module "keyspaces_us_west_1" {
  source   = "./modules/keyspaces_keyspace"
  for_each = var.keyspaces_us_west_1
  providers = { aws = aws.us_west_1 }  # alias provider
}
```

## 4. How Import Works

**Status:** ✅ **Already completed** — all resources imported once into state during initial discovery reconciliation.

### Import Command Pattern
```bash
terraform import -var-file=environments/sg.tfvars '<module>.<resource_type>.<name>' '<cloud_id>'
```

### Example Imports (from `imports.sh`)
```bash
# Athena Workgroup (singleton)
terraform import -var-file environments/sg.tfvars 'module.athena_workgroup.aws_athena_workgroup.this' 'primary'

# IAM Policy (for_each)
terraform import -var-file environments/sg.tfvars 'module.iam_policy["all"].aws_iam_policy.this' 'arn:aws:iam::714114208215:policy/All'

# IAM Role (for_each)
terraform import -var-file environments/sg.tfvars 'module.iam_role["awsserviceroleforamazonelasticfilesystem"].aws_iam_role.this' 'AWSServiceRoleForAmazonElasticFileSystem'

# Internet Gateway (singleton)
terraform import -var-file environments/sg.tfvars 'module.internet_gateway.aws_internet_gateway.this' 'igw-02aec4b4978ee2879'

# Default Subnet (for_each)
terraform import -var-file environments/sg.tfvars 'module.default_subnet["aws_subnet_1"].aws_default_subnet.this' 'subnet-0aec9ccc3d679b626'

# Keyspaces with aliased provider (for_each)
terraform import -var-file environments/sg.tfvars 'module.keyspaces_eu_central_1["system"].aws_keyspaces_keyspace.this' 'system'

# CloudFormation Stack (singleton)
terraform import -var-file environments/sg.tfvars 'module.cloudformation_stack.aws_cloudformation_stack.this' 'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
```

### Key Import Notes
1. **IAM Policies:** Imported by ARN, not policy ID
2. **Keyspaces:** Imported by keyspace name
3. **IAM Roles (service-linked):** Imported by role name
4. **CloudFormation Stack:** Imported by full stack ARN
5. **Internet Gateway:** Imported by IGW ID
6. **Subnets:** Imported by subnet ID
7. **VPC resources:** Imported by resource ID

### Re-importing a Single Resource (if state is lost)
```bash
# Example: re-import the default VPC
terraform import -var-file environments/sg.tfvars 'module.default_vpc.aws_default_vpc.this' 'vpc-05fed6e9ac0f64a6e'

# Example: re-import a Keyspaces keyspace in eu-central-1
terraform import -var-file environments/sg.tfvars 'module.keyspaces_eu_central_1["system"].aws_keyspaces_keyspace.this' 'system'
```

The `imports.sh` script documents all original import commands; re-run specific lines if state is lost or corrupted.

## 5. How to Use the Code

### Prerequisites
- Terraform >= 1.3.0
- AWS provider >= 5.0.0
- AWS credentials configured (environment variables `AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY` or credential file)

### Initialize Terraform
```bash
cd /mnt/sg_workspace/user/global-settings
terraform init
```

### Plan Changes (dry run)
```bash
terraform plan -var-file=environments/sg.tfvars
```

### Apply Changes
```bash
terraform apply -var-file=environments/sg.tfvars
```

### Target Specific Resource (optional)
```bash
terraform plan -var-file=environments/sg.tfvars -target='module.athena_workgroup.aws_athena_workgroup.this'
```

### Destroy All Resources (use with caution!)
```bash
terraform destroy -var-file=environments/sg.tfvars
```

### Switch to Another Environment (e.g., dev → prod)
1. **Copy the environment file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```
2. **Edit the new file with production values:**
   ```bash
   vim environments/prod.tfvars
   ```
   (Update variables like resource names, keyspace replication strategy, IAM policy attachments, etc.)
3. **Plan with the new environment file:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   ```
4. **Apply with the new environment file:**
   ```bash
   terraform apply -var-file=environments/prod.tfvars
   ```

**No `.tf` file edits are required** — all configuration is driven by the `-var-file` parameter.

## 6. Variables

### Athena Workgroup Variables
| Variable | Type | Default | Description |
|---|---|---|---|
| `athena_workgroup_name` | string | `"primary"` | Name of the Athena workgroup |
| `athena_workgroup_description` | string | `""` | Description for workgroup |
| `athena_workgroup_state` | string | `"ENABLED"` | State: `"ENABLED"` or `"DISABLED"` |
| `athena_workgroup_enforce_workgroup_configuration` | bool | `false` | Enforce workgroup configuration on queries |
| `athena_workgroup_publish_cloudwatch_metrics_enabled` | bool | `true` | Publish metrics to CloudWatch |
| `athena_workgroup_requester_pays_enabled` | bool | `false` | Enable requester pays mode |

### CloudFormation Stack Variables
| Variable | Type | Default | Description |
|---|---|---|---|
| `cloudformation_stack_name` | string | `"stulyze-app"` | Name of the CloudFormation stack |
| `cloudformation_stack_disable_rollback` | bool | `false` | Disable automatic rollback on stack creation failure |

### IAM Policy Variables
| Variable | Type | Default | Description |
|---|---|---|---|
| `iam_policies` | map(object({...})) | `{}` | Map of IAM policies. Keys: policy identifiers; values: `{name, path, description, policy}` |

**Policy map keys in `sg.tfvars`:**
- `"all"` → policy name: `"All"` (admin policy)
- `"amazonsagemaker_executionpolicy_20231125t142640"` → SageMaker execution policy
- `"amazonsagemakerservicecatalogproductsuserole_20231125t142608"` → SageMaker Service Catalog policy
- `"aws_iam_policy_4"` → Cognito SNS policy

### IAM Role Variables
| Variable | Type | Default | Description |
|---|---|---|---|
| `iam_roles` | map(object({...})) | `{}` | Map of IAM roles. Keys: role identifiers; values: `{name, path, description, assume_role_policy, max_session_duration}` |

**Role map keys in `sg.tfvars`:**
- `"awsserviceroleforamazonelasticfilesystem"` → EFS service-linked role
- `"awsserviceroleforapigateway"` → API Gateway service-linked role
- `"awsserviceroleforamazonsagemakernotebooks"` → SageMaker Notebooks service-linked role
- `"awsserviceroleforsupport"` → Support service-linked role

### Internet Gateway Variables
| Variable | Type | Default | Description |
|---|---|---|---|
| `internet_gateway_vpc_id` | string | `""` | VPC ID to attach the IGW to |

### Default Subnet Variables
| Variable | Type | Default | Description |
|---|---|---|---|
| `default_subnets` | map(object({...})) | `{}` | Map of default subnets. Keys: subnet identifiers; values: `{availability_zone, map_public_ip_on_launch, tags}` |

**Subnet map keys in `sg.tfvars`:**
- `"aws_subnet_1"` → AZ: `ap-southeast-1b`
- `"aws_subnet_2"` → AZ: `ap-southeast-1a`

### Security Group Variables
| Variable | Type | Default | Description |
|---|---|---|---|
| `security_groups` | map(object({...})) | `{}` | Map of security groups (non-default). **Currently empty** — phantom SageMaker NFS SGs removed |

### Default Security Group Variables
| Variable | Type | Default | Description |
|---|---|---|---|
| `default_security_group_vpc_id` | string | `""` | VPC ID for the default security group |
| `default_security_group_ingress` | list(object({...})) | `[]` | Ingress rules for default SG |
| `default_security_group_egress` | list(object({...})) | `[]` | Egress rules for default SG |

### Route Table Variables
| Variable | Type | Default | Description |
|---|---|---|---|
| `route_table_vpc_id` | string | `""` | VPC ID for the route table |
| `route_table_routes` | list(object({...})) | `[]` | List of routes (supports cidr_block, gateway_id, nat_gateway_id, etc.) |

### Default Network ACL Variables
| Variable | Type | Default | Description |
|---|---|---|---|
| `default_network_acl_id` | string | `""` | ID of the default NACL (or NACL to manage) |
| `default_network_acl_subnet_ids` | list(string) | `[]` | Subnet IDs associated with the NACL |
| `default_network_acl_ingress` | list(object({...})) | `[]` | Ingress rules (rule_no, action, protocol, cidr_block, from_port, to_port) |
| `default_network_acl_egress` | list(object({...})) | `[]` | Egress rules (same structure) |

### Keyspaces Variables
| Variable | Type | Default | Description |
|---|---|---|---|
| `keyspaces_ap_southeast_1` | map(object({...})) | `{}` | Map of keyspaces in ap-southeast-1 region; values: `{name, replication_strategy, tags}` |
| `keyspaces_eu_central_1` | map(object({...})) | `{}` | Map of keyspaces in eu-central-1 region; values: `{name, replication_strategy, tags}` |
| `keyspaces_us_west_1` | map(object({...})) | `{}` | Map of keyspaces in us-west-1 region; values: `{name, replication_strategy, tags}` |

**Keyspace map keys in `sg.tfvars`:**
- `ap-southeast-1`: `"system"`, `"system_schema_mcs"`
- `eu-central-1`: `"system"`, `"system_multiregion_info"`
- `us-west-1`: `"system_schema_mcs"`

### Sensitive Variables
**Note:** No sensitive variables found. All values (including IAM policies, assume role policies, and keyspace configurations) are specified in `environments/sg.tfvars`. No `secrets.auto.tfvars` is required.

## 7. Infrastructure Graph

```
AWS Account (714114208215)
│
├─ Athena
│  └─ athena_workgroup ("primary")
│     └── Stores queries in S3 (external)
│
├─ IAM (Global)
│  │
│  ├─ Policies
│  │  ├── "All" (admin: Action:* Resource:*)
│  │  ├── "AmazonSageMaker-ExecutionPolicy-..." (S3 ops)
│  │  ├── "AmazonSageMakerServiceCatalogProductsUseRole-..." (CloudFormation, CodeBuild, Glue, etc.)
│  │  └── "Cognito-1690255817691" (SNS publish)
│  │
│  └─ Roles (Service-Linked)
│     ├── "AWSServiceRoleForAmazonElasticFileSystem"
│     ├── "AWSServiceRoleForAPIGateway"
│     ├── "AWSServiceRoleForAmazonSageMakerNotebooks"
│     └── "AWSServiceRoleForSupport"
│
├─ CloudFormation
│  └─ Stack "stulyze-app" (template: external)
│     └── [managed externally]
│
└─ VPC Infrastructure (ap-southeast-1 Default VPC: vpc-05fed6e9ac0f64a6e)
   │
   ├─ Internet Gateway (igw-02aec4b4978ee2879)
   │  └── Attached to VPC
   │
   ├─ Default Subnets
   │  ├── ap-southeast-1a: subnet-0df3e594471580676 (public)
   │  └── ap-southeast-1b: subnet-0aec9ccc3d679b626 (public)
   │
   ├─ Security Groups
   │  └─ Default SG (sg-0b58b33cabde6d297)
   │     ├── Ingress: self-referencing (allow traffic from SG itself)
   │     └── Egress: 0.0.0.0/0 (allow all outbound)
   │
   ├─ Route Table (rtb-011310e36ec8c4564)
   │  └── Route: 0.0.0.0/0 → igw-02aec4b4978ee2879 (default route to IGW)
   │
   └─ Network ACL (acl-0b1b4715940488f98)
      ├── Associated subnets:
      │   ├── subnet-0df3e594471580676
      │   ├── subnet-0aec9ccc3d679b626
      │   └── subnet-0aee82bad124320d3 (discovered, not in default_subnets)
      ├── Ingress: allow all (protocol: -1, cidr: 0.0.0.0/0)
      └── Egress: allow all (protocol: -1, cidr: 0.0.0.0/0)

Apache Cassandra Keyspaces (Amazon Keyspaces)
│
├─ ap-southeast-1
│  ├── "system" (SINGLE_REGION)
│  └── "system_schema_mcs" (SINGLE_REGION)
│
├─ eu-central-1 (via aws.eu_central_1 provider)
│  ├── "system" (SINGLE_REGION)
│  └── "system_multiregion_info" (SINGLE_REGION)
│
└─ us-west-1 (via aws.us_west_1 provider)
   └── "system_schema_mcs" (SINGLE_REGION)

Legend:
  vpc_id ──→ attached/referenced by
  contains ─→ nested/child resource
```

## 8. Notable Decisions & Caveats

### Lifecycle Ignore Changes

**CloudFormation Stack (`module.cloudformation_stack`)**
- **Ignored fields:** `template_body, template_url, parameters, capabilities, on_failure, timeout_in_minutes, notification_arns, policy_body, policy_url, iam_role_arn, tags`
- **Rationale:** The CloudFormation stack body and parameters are managed externally (likely by another tool or CI/CD process). Terraform imports only the stack metadata (name, creation timestamp). To prevent Terraform from attempting to overwrite the template body on every plan/apply, these fields are ignored. Updates to the template must be made outside Terraform.

**IAM Roles (`module.iam_role["*"]`)**
- **Ignored field:** `inline_policy`
- **Rationale:** Service-linked roles (AWS-managed roles like `AWSServiceRoleForAmazonElasticFileSystem`) have AWS-managed inline policies that Terraform cannot read back after import. By ignoring this field, Terraform focuses on managing the role itself (trust policy, max session duration) while AWS manages the permissions.

### Phantom Resources Excluded

Two SageMaker-provisioned security groups were discovered but **not imported** into state:
- `sg-09b139379252db92a` (security-group-for-outbound-nfs-d-e7rysy0e6m17)
- `sg-0c5fca3d0f618a860` (security-group-for-inbound-nfs-d-e7rysy0e6m17)

**Reason:** These SGs no longer exist in the cloud (they were created by SageMaker for EFS provisioning but have since been deleted). If they were accidentally left in state, they would cause `terraform plan` to show "destroy" actions that cannot be applied. **Decision:** Excluded from state to prevent drift errors.

**Note:** Lines 22–24 in `imports.sh` attempted to import these, but they remain commented out in the actual code since the resources don't exist.

### Default Network ACL Subnet Association

The `default_network_acl_subnet_ids` in `sg.tfvars` includes:
```
["subnet-0df3e594471580676", "subnet-0aec9ccc3d679b626", "subnet-0aee82bad124320d3"]
```

- First two subnets (`subnet-0df3e594471580676`, `subnet-0aec9ccc3d679b626`) are managed by `module.default_subnet["aws_subnet_1"]` and `module.default_subnet["aws_subnet_2"]`.
- Third subnet (`subnet-0aee82bad124320d3`) was discovered but is **not explicitly managed** by a `default_subnet` module instance. However, it is associated with the default NACL in live state.

**Rationale:** Including it in the NACL association preserves the discovered association without actively managing the subnet via Terraform. This prevents drift in the NACL state while keeping the actual subnet management simple (only the two explicitly created default subnets are managed).

### Import ID Mapping Notes

1. **IAM Policies:** Imported by ARN, not policy ID
   - Discovery output: policy_id (e.g., `ANPA2MREGCHLVBL2FKNF2`)
   - Import ID: Full ARN (e.g., `arn:aws:iam::714114208215:policy/All`)
   - Reason: Terraform `aws_iam_policy` resource uses `arn` as the import ID

2. **Keyspaces:** Imported by keyspace name (not ARN)
   - Discovery output: keyspace name
   - Import ID: keyspace name (e.g., `system`)
   - Reason: Terraform `aws_keyspaces_keyspace` resource uses `name` as the import ID

3. **CloudFormation Stack:** Imported by full stack ARN
   - Format: `arn:aws:cloudformation:<region>:<account>:stack/<stack-name>/<stack-id>`
   - Reason: Allows precise identification in multi-region deployments

### Multi-region Deployment Strategy

Three provider aliases enable single-root deployment across regions:
- **`aws` (default):** ap-southeast-1 (primary region)
- **`aws.eu_central_1`:** eu-central-1
- **`aws.us_west_1`:** us-west-1

**Decision:** Each `keyspaces_*` module instance specifies its provider via the `providers` block, allowing keyspace definitions to be colocated with other AP resources while deploying to different regions without code duplication.

### Default Resources Adoption Strategy

Rather than creating new VPC infrastructure, the code adopts AWS defaults using `aws_default_*` resource types:
- `aws_default_vpc` — Manages the default VPC (not create, but adopt)
- `aws_default_subnet` — Manages default subnets
- `aws_default_security_group` — Manages the default security group for the VPC
- `aws_network_acl` (imported as default NACL) — Manages the default NACL

**Rationale:** AWS accounts come with a default VPC. Adopting it via `aws_default_*` resources prevents the need to recreate infrastructure and integrates existing network components into Terraform management without disruption.

### Computed Attributes Omitted

The following computed/read-only attributes are intentionally **not** included in variable inputs:
- **IAM Policy:** `policy_id`, `arn` (computed)
- **IAM Role:** `arn`, `create_date`, `unique_id` (computed)
- **VPC/Subnets:** Availability zone IDs, availability zone names (computed but not needed for management)
- **Security Groups:** `owner_id` (computed)
- **Internet Gateway:** `owner_id` (computed)
- **Route Table:** Routes are dynamic; computed route IDs are not exposed
- **Keyspaces:** `arn`, `resource_capacity` (computed)

These attributes are available as Terraform outputs if needed downstream.

### No Credentials in Code

All variables (including IAM assume role policies and keyspace configurations) are **plaintext and non-sensitive**. No encrypted or credential-bearing secrets are stored in `.tf` files or `sg.tfvars`. If credentials or sensitive config is needed in future, use:
- `sensitive = true` in variable definitions
- `secrets.auto.tfvars` (git-ignored)
- Environment variable: `TF_VAR_<variable_name>`
- AWS Secrets Manager + `terraform_remote_state` data source

---

**Last Reconciliation:** 2026-08-27  
**Status:** ✅ Infrastructure fully imported and reconciled. `terraform plan -var-file=environments/sg.tfvars` shows 0 changes.
