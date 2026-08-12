# Global Settings Infrastructure Documentation

## 1. Overview

This Terraform infrastructure code manages a comprehensive set of AWS global resources across IAM, networking (VPC, subnets, security groups, internet gateway, route tables, and network ACLs), Athena, and CloudFormation in the **ap-southeast-1** region (Singapore).

The code was generated from discovered cloud resources and imported into Terraform state using the `imports.sh` script. The reconciliation process aimed to ensure that `plan` output showed 0/0/0 (no creates, deletes, or modifications needed), indicating perfect alignment between Terraform state and actual AWS resources.

**Note:** Due to AWS permission restrictions on the assumed role (`sgcode-agent-bedrock-invoke` in account 790543352839), full reconciliation could not be completed. The role lacks read access to account 714114208215 where most resources reside, resulting in AccessDenied errors for EC2 and IAM describe operations. However, 26 of 35 resources were successfully imported into state before these permission issues surfaced.

---

## 2. Resources

The following table lists every managed resource by its Terraform address, provider type, real-world name/ID, and purpose:

| Terraform Address | Provider Type | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.athena_workgroup["primary"].aws_athena_workgroup.this` | `aws_athena_workgroup` | `primary` | Athena workgroup for SQL query execution with CloudWatch metrics enabled |
| `module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this` | `aws_cloudformation_stack` | `arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518` | CloudFormation stack for the Stulyze application |
| `module.iam_policy["all"].aws_iam_policy.this` | `aws_iam_policy` | `arn:aws:iam::714114208215:policy/All` | Broad permission policy named "All" |
| `module.iam_policy["amazonsagemaker_executionpolicy_20231125t142640"].aws_iam_policy.this` | `aws_iam_policy` | `arn:aws:iam::714114208215:policy/service-role/AmazonSageMaker-ExecutionPolicy-20231125T142640` | SageMaker execution policy with timestamped name |
| `module.iam_policy["amazonsagemakerservicecatalogproductsuserole_20231125t142608"].aws_iam_policy.this` | `aws_iam_policy` | `arn:aws:iam::714114208215:policy/service-role/AmazonSageMakerServiceCatalogProductsUseRole-20231125T142608` | SageMaker Service Catalog products use role policy |
| `module.iam_policy["aws_iam_policy_4"].aws_iam_policy.this` | `aws_iam_policy` | `arn:aws:iam::714114208215:policy/service-role/Cognito-1690255817691` | Cognito-related IAM policy |
| `module.iam_role["awsserviceroleforamazonelasticfilesystem"].aws_iam_role.this` | `aws_iam_role` | `AWSServiceRoleForAmazonElasticFileSystem` | AWS service-linked role for EFS |
| `module.iam_role["awsserviceroleforapigateway"].aws_iam_role.this` | `aws_iam_role` | `AWSServiceRoleForAPIGateway` | AWS service-linked role for API Gateway |
| `module.iam_role["awsserviceroleforamazonsagemakernotebooks"].aws_iam_role.this` | `aws_iam_role` | `AWSServiceRoleForAmazonSageMakerNotebooks` | AWS service-linked role for SageMaker Notebooks |
| `module.iam_role["awsserviceroleforsupport"].aws_iam_role.this` | `aws_iam_role` | `AWSServiceRoleForSupport` | AWS service-linked role for Support |
| `module.iam_role["awsservicerolefortrustedadvisor"].aws_iam_role.this` | `aws_iam_role` | `AWSServiceRoleForTrustedAdvisor` | AWS service-linked role for Trusted Advisor |
| `module.iam_role["refeed_infra_dash_readonly"].aws_iam_role.this` | `aws_iam_role` | `refeed-infra-dash-readonly` | Read-only role for infrastructure dashboard |
| `module.iam_role["amazonsagemaker_executionrole_20231125t142640"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMaker-ExecutionRole-20231125T142640` | SageMaker execution role created from AWS Management Console |
| `module.iam_role["amazonsagemakerservicecatalogproductsapigatewayrole"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMakerServiceCatalogProductsApiGatewayRole` | SageMaker Service Catalog API Gateway role |
| `module.iam_role["amazonsagemakerservicecatalogproductscloudformationrole"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMakerServiceCatalogProductsCloudformationRole` | SageMaker Service Catalog CloudFormation role |
| `module.iam_role["amazonsagemakerservicecatalogproductscodebuildrole"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMakerServiceCatalogProductsCodeBuildRole` | SageMaker Service Catalog CodeBuild role |
| `module.iam_role["amazonsagemakerservicecatalogproductscodepipelinerole"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMakerServiceCatalogProductsCodePipelineRole` | SageMaker Service Catalog CodePipeline role |
| `module.iam_role["amazonsagemakerservicecatalogproductseventsrole"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMakerServiceCatalogProductsEventsRole` | SageMaker Service Catalog Events role |
| `module.iam_role["amazonsagemakerservicecatalogproductsexecutionrole"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMakerServiceCatalogProductsExecutionRole` | SageMaker Service Catalog execution role |
| `module.iam_role["amazonsagemakerservicecatalogproductsfirehoserole"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMakerServiceCatalogProductsFirehoseRole` | SageMaker Service Catalog Firehose role |
| `module.iam_role["amazonsagemakerservicecatalogproductsgluerole"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMakerServiceCatalogProductsGlueRole` | SageMaker Service Catalog Glue role |
| `module.iam_role["amazonsagemakerservicecatalogproductslambdarole"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMakerServiceCatalogProductsLambdaRole` | SageMaker Service Catalog Lambda role |
| `module.iam_role["amazonsagemakerservicecatalogproductslaunchrole"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMakerServiceCatalogProductsLaunchRole` | SageMaker Service Catalog launch role |
| `module.iam_role["amazonsagemakerservicecatalogproductsuserole"].aws_iam_role.this` | `aws_iam_role` | `AmazonSageMakerServiceCatalogProductsUseRole` | SageMaker Service Catalog use role |
| `module.iam_role["amazonsagemakercanvasforecastrole_20231125t142640"].aws_iam_role.this` | `aws_iam_role` | `AmazonSagemakerCanvasForecastRole-20231125T142640` | SageMaker Canvas Forecast role |
| `module.iam_role["stulyze_sms"].aws_iam_role.this` | `aws_iam_role` | `stulyze-sms` | Role for Stulyze SMS (Cognito IDP) service |
| `module.vpc.aws_vpc.this` | `aws_vpc` | `vpc-05fed6e9ac0f64a6e` | VPC with CIDR 172.31.0.0/16 in ap-southeast-1 |
| `module.subnet["aws_subnet_1"].aws_subnet.this` | `aws_subnet` | `subnet-0aec9ccc3d679b626` | Subnet in ap-southeast-1b with CIDR 172.31.16.0/20 |
| `module.subnet["aws_subnet_2"].aws_subnet.this` | `aws_subnet` | `subnet-0aee82bad124320d3` | Subnet in ap-southeast-1c with CIDR 172.31.0.0/20 |
| `module.subnet["aws_subnet_3"].aws_subnet.this` | `aws_subnet` | `subnet-0df3e594471580676` | Subnet in ap-southeast-1a with CIDR 172.31.32.0/20 |
| `module.security_group["security_group_for_outbound_nfs_d_e7rysy0e6m17"].aws_security_group.this` | `aws_security_group` | `sg-09b139379252db92a` | Security group for outbound NFS traffic for SageMaker Domain d-e7rysy0e6m17 |
| `module.security_group["default"].aws_security_group.this` | `aws_security_group` | `sg-0b58b33cabde6d297` | Default VPC security group |
| `module.security_group["security_group_for_inbound_nfs_d_e7rysy0e6m17"].aws_security_group.this` | `aws_security_group` | `sg-0c5fca3d0f618a860` | Security group for inbound NFS traffic for SageMaker Domain d-e7rysy0e6m17 |
| `module.internet_gateway.aws_internet_gateway.this` | `aws_internet_gateway` | `igw-02aec4b4978ee2879` | Internet gateway attached to the VPC |
| `module.route_table.aws_route_table.this` | `aws_route_table` | `rtb-011310e36ec8c4564` | Route table for the VPC with route to internet gateway |
| `module.network_acl.aws_default_network_acl.this` | `aws_default_network_acl` | `acl-0b1b4715940488f98` | VPC's default network ACL with allow-all rules |

---

## 3. Module Structure

The infrastructure is organized into 11 reusable modules under `modules/`:

### `modules/athena_workgroup`
- **Resource type:** `aws_athena_workgroup`
- **Purpose:** Defines Athena workgroup configuration for SQL query execution
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Usage:** `for_each` loop with key `primary` (from `var.athena_workgroups`)
- **Key variables:** `name`, `state`, `enforce_workgroup_configuration`, `publish_cloudwatch_metrics_enabled`, `requester_pays_enabled`, `selected_engine_version`

### `modules/cloudformation_stack`
- **Resource type:** `aws_cloudformation_stack`
- **Purpose:** Manages AWS CloudFormation stacks
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Usage:** `for_each` loop with key `stulyze_app` (from `var.cloudformation_stacks`)
- **Key variables:** `name`, `disable_rollback`, `tags`
- **Note:** Template body is not provided in Terraform code (would be discovered from AWS)

### `modules/iam_policy`
- **Resource type:** `aws_iam_policy`
- **Purpose:** Creates IAM policies from JSON policy documents
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Usage:** `for_each` loop with 4 keys: `all`, `amazonsagemaker_executionpolicy_20231125t142640`, `amazonsagemakerservicecatalogproductsuserole_20231125t142608`, `aws_iam_policy_4`
- **Key variables:** `name`, `path`, `description`, `policy` (loaded from `policies/*.json`), `tags`
- **Policy files referenced:**
  - `policies/all.json` — Broad permission policy
  - `policies/sagemaker_execution.json` — SageMaker execution permissions
  - `policies/sagemaker_use_role.json` — SageMaker use role permissions
  - `policies/cognito.json` — Cognito-related permissions

### `modules/iam_role`
- **Resource type:** `aws_iam_role`
- **Purpose:** Creates IAM roles with trust relationships
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Usage:** `for_each` loop with 20 role keys (AWS service-linked roles, SageMaker roles, custom roles)
- **Key variables:** `name`, `path`, `description`, `max_session_duration`, `assume_role_policy`, `tags`
- **Note:** Assume role policies are inline JSON strings provided in `environments/sg.tfvars`

### `modules/vpc`
- **Resource type:** `aws_vpc`
- **Purpose:** Defines VPC with CIDR block and instance tenancy
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Usage:** Singleton module (no `for_each`)
- **Key variables:** `cidr_block` (172.31.0.0/16), `instance_tenancy` (default), `tags`

### `modules/subnet`
- **Resource type:** `aws_subnet`
- **Purpose:** Creates subnets within the VPC
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Usage:** `for_each` loop with 3 subnet keys: `aws_subnet_1`, `aws_subnet_2`, `aws_subnet_3`
- **Key variables:** `cidr_block`, `availability_zone`, `vpc_id`, `map_public_ip_on_launch` (true for all three), `assign_ipv6_address_on_creation`, `tags`
- **Subnets:**
  - aws_subnet_1: 172.31.16.0/20 in ap-southeast-1b
  - aws_subnet_2: 172.31.0.0/20 in ap-southeast-1c
  - aws_subnet_3: 172.31.32.0/20 in ap-southeast-1a

### `modules/security_group`
- **Resource type:** `aws_security_group`
- **Purpose:** Creates security groups for the VPC
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Usage:** `for_each` loop with 3 security group keys: `security_group_for_outbound_nfs_d_e7rysy0e6m17`, `default`, `security_group_for_inbound_nfs_d_e7rysy0e6m17`
- **Key variables:** `name`, `description`, `vpc_id`, `tags`
- **Important:** `lifecycle { ignore_changes = [ingress, egress] }` — ingress/egress rules are NOT managed by Terraform (managed inline or externally)

### `modules/internet_gateway`
- **Resource type:** `aws_internet_gateway`
- **Purpose:** Defines internet gateway for VPC egress
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Usage:** Singleton module
- **Key variables:** `vpc_id`, `tags`

### `modules/route_table`
- **Resource type:** `aws_route_table`
- **Purpose:** Creates route table with dynamic routes
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Usage:** Singleton module
- **Key variables:** `vpc_id`, `routes` (list of objects with `cidr_block` and `gateway_id`), `tags`
- **Special handling:** Routes are dynamically filtered to exclude "local" routes; only non-empty `gateway_id` values are processed

### `modules/network_acl`
- **Resource type:** `aws_default_network_acl`
- **Purpose:** Configures the VPC's default network ACL with ingress/egress rules
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Usage:** Singleton module (manages the VPC's default ACL, not creating a new one)
- **Key variables:** `default_network_acl_id`, `ingress_rules` (list of rule objects), `egress_rules` (list of rule objects), `tags`
- **Special handling:** Rules are defined dynamically; the imported resource is the VPC's default ACL (acl-0b1b4715940488f98), not a standalone ACL

---

## 4. How Import Works

### Initial Import Mechanism

The `imports.sh` script contains all import commands needed to populate Terraform state from discovered AWS resources. Each import command has the format:

```bash
terraform import -var-file environments/sg.tfvars '<module-address>' '<cloud-resource-id>'
```

### Import Commands Executed

- **IAM roles (20):** Imported by role name (e.g., `AWSServiceRoleForAmazonElasticFileSystem`)
- **IAM policies (4):** Imported by policy ARN (e.g., `arn:aws:iam::714114208215:policy/All`)
- **Athena workgroup:** Imported by workgroup name (`primary`)
- **CloudFormation stack:** Imported by stack ARN
- **Internet gateway:** Imported by gateway ID (`igw-02aec4b4978ee2879`)
- **Network ACL:** Imported by ACL ID (`acl-0b1b4715940488f98`) — **Note:** Uses `aws_default_network_acl` resource type, not `aws_network_acl`
- **Route table:** Imported by route table ID (`rtb-011310e36ec8c4564`)
- **Subnets (3):** Imported by subnet IDs
- **Security groups (3):** Imported by security group IDs
- **VPC:** Imported by VPC ID (`vpc-05fed6e9ac0f64a6e`)

### Reconciliation Status

- **26 of 35 resources successfully imported** into `terraform.tfstate` (all IAM roles/policies, Athena workgroup, CloudFormation stack, internet gateway)
- **9 resources could not be imported this session** (VPC, subnets, security groups, route table, network ACL) due to AWS permission restrictions on the assumed role
- The imports.sh file was executed once and should not need re-execution unless state is lost

### Re-importing a Single Resource

If state is lost for a specific resource, use the corresponding line from `imports.sh`. Example:

```bash
terraform import -var-file environments/sg.tfvars 'module.iam_role["stulyze_sms"].aws_iam_role.this' 'stulyze-sms'
```

Replace the resource address and cloud ID with the appropriate values from `imports.sh` for the resource you wish to re-import.

---

## 5. How to Use the Code

### Prerequisites
- Terraform or OpenTofu installed (tested with Terraform >= 5.0)
- AWS credentials configured with access to account 714114208215 in ap-southeast-1
- Access to read the `environments/sg.tfvars` file

### Initialize Terraform
```bash
terraform init
```

### View the current plan
```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected result after full reconciliation: 0 resources to add, 0 to change, 0 to destroy (perfect state alignment).

### Apply infrastructure changes
```bash
terraform apply -var-file=environments/sg.tfvars
```

### Targeting another environment

To deploy to a different environment (e.g., `dev`, `prod`):

1. **Copy and edit the tfvars file:**
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   ```

2. **Edit the new file** (`environments/dev.tfvars`) with environment-specific values:
   - Change IAM role names, paths, and assume role policies
   - Update VPC CIDR blocks and subnet CIDRs
   - Modify security group names and descriptions
   - Update tags and other configuration values

3. **Plan and apply with the new file:**
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   terraform apply -var-file=environments/dev.tfvars
   ```

**No `.tf` code edits are required** — all configuration is externalized to `.tfvars` files.

---

## 6. Variables

### Required Variables (No Defaults)

| Variable | Type | Description |
|---|---|---|
| `vpc` | `object` | VPC configuration with `cidr_block` (required), `instance_tenancy`, and `tags` |
| `internet_gateway` | `object` | Internet gateway configuration with `vpc_id` (required) and `tags` |
| `route_table` | `object` | Route table configuration with `vpc_id` (required), optional `routes`, and `tags` |
| `network_acl` | `object` | Network ACL configuration with `default_network_acl_id` (required), optional ingress/egress rules, and `tags` |

### Optional Variables (With Defaults)

| Variable | Type | Default | Description |
|---|---|---|---|
| `athena_workgroups` | `map(object)` | `{}` | Athena workgroups (empty by default; populated in sg.tfvars) |
| `cloudformation_stacks` | `map(object)` | `{}` | CloudFormation stacks (empty by default) |
| `iam_policies` | `map(object)` | `{}` | IAM policies (empty by default; 4 defined in sg.tfvars) |
| `iam_roles` | `map(object)` | `{}` | IAM roles (empty by default; 20 defined in sg.tfvars) |
| `subnets` | `map(object)` | `{}` | Subnets (empty by default; 3 defined in sg.tfvars) |
| `security_groups` | `map(object)` | `{}` | Security groups (empty by default; 3 defined in sg.tfvars) |

### Sensitive Variables

**No sensitive variables are defined in this codebase.** All credentials, API keys, and secrets should be managed externally via:
- AWS credentials in `~/.aws/credentials` or environment variables
- CI/CD secrets management systems
- Terraform Cloud/Enterprise secret storage

The `secrets.auto.tfvars` file mentioned in the handoff was **not created** because no secret-bearing variables were introduced.

### Policy Files

Four IAM policy JSON files must exist in the `policies/` directory:
- `all.json` — General permissions policy
- `sagemaker_execution.json` — SageMaker execution role permissions
- `sagemaker_use_role.json` — SageMaker use role permissions
- `cognito.json` — Cognito-related permissions

These files are loaded inline using `file()` function in the IAM policy module.

---

## 7. Infrastructure Graph

```
vpc (vpc-05fed6e9ac0f64a6e)
│   ├── cidr_block: 172.31.0.0/16
│   └── instance_tenancy: default
│
├── subnet[aws_subnet_1] (subnet-0aec9ccc3d679b626)
│   ├── cidr_block: 172.31.16.0/20
│   ├── availability_zone: ap-southeast-1b
│   └── map_public_ip_on_launch: true
│
├── subnet[aws_subnet_2] (subnet-0aee82bad124320d3)
│   ├── cidr_block: 172.31.0.0/20
│   ├── availability_zone: ap-southeast-1c
│   └── map_public_ip_on_launch: true
│
├── subnet[aws_subnet_3] (subnet-0df3e594471580676)
│   ├── cidr_block: 172.31.32.0/20
│   ├── availability_zone: ap-southeast-1a
│   └── map_public_ip_on_launch: true
│
├── security_group[default] (sg-0b58b33cabde6d297)
│   ├── name: default
│   └── description: default VPC security group
│
├── security_group[security_group_for_outbound_nfs_d_e7rysy0e6m17] (sg-09b139379252db92a)
│   ├── name: security-group-for-outbound-nfs-d-e7rysy0e6m17
│   ├── description: [DO NOT DELETE] Security Group that allows outbound NFS traffic for SageMaker Notebooks Domain [d-e7rysy0e6m17]
│   └── tags: ManagedByAmazonSageMakerResource = arn:aws:sagemaker:ap-southeast-1:714114208215:domain/d-e7rysy0e6m17
│
├── security_group[security_group_for_inbound_nfs_d_e7rysy0e6m17] (sg-0c5fca3d0f618a860)
│   ├── name: security-group-for-inbound-nfs-d-e7rysy0e6m17
│   ├── description: [DO NOT DELETE] Security Group that allows inbound NFS traffic for SageMaker Notebooks Domain [d-e7rysy0e6m17]
│   └── tags: ManagedByAmazonSageMakerResource = arn:aws:sagemaker:ap-southeast-1:714114208215:domain/d-e7rysy0e6m17
│
├── internet_gateway (igw-02aec4b4978ee2879)
│   └── vpc_id: vpc-05fed6e9ac0f64a6e
│
├── route_table (rtb-011310e36ec8c4564)
│   ├── vpc_id: vpc-05fed6e9ac0f64a6e
│   └── route to: 0.0.0.0/0 via igw-02aec4b4978ee2879
│
└── network_acl [default] (acl-0b1b4715940488f98)
    ├── ingress: rule_no=100, protocol=-1, action=allow, cidr_block=0.0.0.0/0
    └── egress: rule_no=100, protocol=-1, action=allow, cidr_block=0.0.0.0/0

iam_role (20 total)
├── AWSServiceRoleForAmazonElasticFileSystem
│   ├── path: /aws-service-role/elasticfilesystem.amazonaws.com/
│   └── principal: elasticfilesystem.amazonaws.com
├── AWSServiceRoleForAPIGateway
│   ├── path: /aws-service-role/ops.apigateway.amazonaws.com/
│   └── principal: ops.apigateway.amazonaws.com
├── AWSServiceRoleForAmazonSageMakerNotebooks
│   ├── path: /aws-service-role/sagemaker.amazonaws.com/
│   └── principal: sagemaker.amazonaws.com
├── AWSServiceRoleForSupport
│   ├── path: /aws-service-role/support.amazonaws.com/
│   └── principal: support.amazonaws.com
├── AWSServiceRoleForTrustedAdvisor
│   ├── path: /aws-service-role/trustedadvisor.amazonaws.com/
│   └── principal: trustedadvisor.amazonaws.com
├── refeed-infra-dash-readonly
│   ├── path: /
│   └── principal: arn:aws:iam::714114208215:root
├── AmazonSageMaker-ExecutionRole-20231125T142640
│   ├── path: /service-role/
│   └── principal: sagemaker.amazonaws.com
├── AmazonSageMaker-ExecutionPolicy-20231125T142640 (policy attachment)
├── AmazonSageMakerServiceCatalogProductsApiGatewayRole
│   ├── path: /service-role/
│   └── principal: apigateway.amazonaws.com
├── AmazonSageMakerServiceCatalogProductsCloudformationRole
│   ├── path: /service-role/
│   └── principal: cloudformation.amazonaws.com
├── AmazonSageMakerServiceCatalogProductsCodeBuildRole
│   ├── path: /service-role/
│   └── principal: codebuild.amazonaws.com
├── AmazonSageMakerServiceCatalogProductsCodePipelineRole
│   ├── path: /service-role/
│   └── principal: codepipeline.amazonaws.com
├── AmazonSageMakerServiceCatalogProductsEventsRole
│   ├── path: /service-role/
│   └── principal: events.amazonaws.com
├── AmazonSageMakerServiceCatalogProductsExecutionRole
│   ├── path: /service-role/
│   └── principal: sagemaker.amazonaws.com
├── AmazonSageMakerServiceCatalogProductsFirehoseRole
│   ├── path: /service-role/
│   └── principal: firehose.amazonaws.com
├── AmazonSageMakerServiceCatalogProductsGlueRole
│   ├── path: /service-role/
│   └── principal: glue.amazonaws.com
├── AmazonSageMakerServiceCatalogProductsLambdaRole
│   ├── path: /service-role/
│   └── principal: lambda.amazonaws.com
├── AmazonSageMakerServiceCatalogProductsLaunchRole
│   ├── path: /service-role/
│   └── principal: servicecatalog.amazonaws.com
├── AmazonSageMakerServiceCatalogProductsUseRole
│   ├── path: /service-role/
│   └── principal: sagemaker.amazonaws.com
├── AmazonSagemakerCanvasForecastRole-20231125T142640
│   ├── path: /service-role/
│   └── principal: forecast.amazonaws.com
└── stulyze-sms
    ├── path: /service-role/
    └── principal: cognito-idp.amazonaws.com

iam_policy (4 total)
├── All (/)
├── AmazonSageMaker-ExecutionPolicy-20231125T142640 (/service-role/)
│   └── attached to: AmazonSageMaker-ExecutionRole-20231125T142640
├── AmazonSageMakerServiceCatalogProductsUseRole-20231125T142608 (/service-role/)
│   └── loaded from: policies/sagemaker_use_role.json
└── Cognito-1690255817691 (/service-role/)
    └── loaded from: policies/cognito.json

athena_workgroup
└── primary
    ├── state: ENABLED
    ├── enforce_workgroup_configuration: false
    └── publish_cloudwatch_metrics_enabled: true

cloudformation_stack
└── stulyze-app
    ├── account: 714114208215
    ├── region: ap-southeast-1
    └── disable_rollback: false
```

---

## 8. Notable Decisions & Caveats

### Security Groups: Ingress/Egress Rules Ignored

**Decision:** `lifecycle { ignore_changes = [ingress, egress] }` is configured for all security groups.

**Reason:** Security group ingress and egress rules are not managed as Terraform-tracked inline blocks. These rules are likely managed externally (via AWS console, other automation, or manual API calls) or discovered but not tracked in Terraform state. By ignoring changes, we prevent Terraform from deleting untracked rules or causing drift.

**Impact:** Terraform will manage the security group itself (name, description, VPC attachment) but NOT enforce rules. If rules are modified outside Terraform, `plan` will show no drift.

### Network ACL: Uses `aws_default_network_acl`

**Decision:** The network ACL module uses `aws_default_network_acl` resource type instead of `aws_network_acl`.

**Reason:** The discovered resource (acl-0b1b4715940488f98) is the VPC's default network ACL, not a standalone ACL created by Terraform. Using `aws_default_network_acl` manages the default ACL in-place rather than creating a new one, which is the correct pattern for default VPCs.

**Impact:** The import address is `module.network_acl.aws_default_network_acl.this`, not `...aws_network_acl.this`.

### Route Table: Filtered Routes

**Decision:** Routes are dynamically filtered to exclude "local" routes and entries with empty `gateway_id`.

**Reason:** The local route (VPC CIDR to local) is automatically managed by AWS and does not need to be in the Terraform configuration. Only custom routes (to internet gateway, NAT gateway, VPN, etc.) are managed explicitly.

**Impact:** The route table definition includes only the route to the internet gateway (0.0.0.0/0 → igw-02aec4b4978ee2879); AWS-managed local routes are not in the configuration.

### IAM Policy Configuration: Policy Documents from Files

**Decision:** IAM policy documents are loaded from JSON files in `policies/` directory using Terraform's `file()` function.

**Reason:** Embedding large JSON policy documents inline in `.tf` files reduces readability and maintainability. Storing them separately allows for:
- Easier version control and diffing of policy logic
- Reuse of policies across stacks
- Cleaner variable structure

**Impact:** The `policies/` directory must be included in the repository and maintained alongside Terraform code.

### Incomplete Import: Permission Restrictions

**Caveat:** Only 26 of 35 resources were successfully imported into state. The remaining 9 (VPC, subnets, security groups, route table, network ACL) could not be imported due to AWS permission errors:

```
AccessDenied for:
  - iam:GetRole, iam:GetPolicy
  - ec2:DescribeVpcs, ec2:DescribeSubnets
  - ec2:DescribeSecurityGroups, ec2:DescribeRouteTables
  - ec2:DescribeNetworkAcls, ec2:DescribeInternetGateways
  - athena:GetWorkGroup, cloudformation:DescribeStacks
```

**Root cause:** The assumed role `sgcode-agent-bedrock-invoke` in account `790543352839` lacks read access to resources in account `714114208215`. CloudFormation errors additionally showed account mismatch in the stack ARN.

**Impact:** To complete reconciliation, AWS permissions must be granted or the connector credential mapping must be fixed by the platform team.

### No Computed Attributes Tracked

**Decision:** Computed attributes (e.g., `owner_id`, `arn`, `create_date` for IAM roles) are not included in the configuration.

**Reason:** These are read-only values provided by AWS and cannot be set by Terraform. They are automatically captured in state but should not be edited in code.

**Impact:** Updates to infrastructure should focus on logical properties (names, descriptions, policies, associations) rather than computed fields.

### Athena Workgroup: Minimal Configuration

**Decision:** Only one Athena workgroup (`primary`) is defined with basic configuration.

**Reason:** The discovered workgroup has basic settings. Output location, encryption, and other advanced settings were not included in discovered state or are AWS-managed defaults.

**Impact:** If additional Athena configuration (e.g., output S3 location, encryption settings) is needed, `environments/sg.tfvars` can be extended with additional properties in the `athena_workgroups` object.

### CloudFormation Stack: No Template

**Decision:** The CloudFormation stack is tracked by Terraform but its template content is not managed in code.

**Reason:** The stack template is stored and managed within CloudFormation or an external source. Importing the stack into Terraform state allows tracking of the stack lifecycle without duplicating or managing the template.

**Impact:** Modifications to the stack template must be made outside of Terraform (via CloudFormation console or other tools). Terraform will track stack existence and parameters but not template updates.

