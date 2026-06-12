# ap-southeast-1-infrastructure

Infrastructure stack containing Athena workgroup, CloudFormation stack, and Internet Gateway

## Overview

This Terraform stack manages infrastructure resources in the ap-southeast-1 region:

- **Athena Workgroup**: Manages the primary Athena workgroup with configurable engine version and CloudWatch metrics
- **CloudFormation Stack**: Manages the stulyze-app CloudFormation stack
- **Internet Gateway**: Manages an Internet Gateway attached to a VPC

## Modules

### athena_workgroup

Manages Athena workgroup configuration with support for workgroup settings, CloudWatch metrics, and engine versioning.

### cloudformation_stack

Manages CloudFormation stack resources with rollback configuration.

### internet_gateway

Manages Internet Gateway and VPC attachment.

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | ap-southeast-1 |
| primary_workgroup_name | string | Name of the primary Athena workgroup | primary |
| primary_workgroup_state | string | State of the primary Athena workgroup | ENABLED |
| primary_workgroup_enforce_workgroup_configuration | bool | Whether the settings for the primary workgroup override client-side settings | false |
| primary_workgroup_publish_cloudwatch_metrics_enabled | bool | Whether Amazon CloudWatch metrics are enabled for the primary workgroup | true |
| primary_workgroup_requester_pays_enabled | bool | Whether members can reference Amazon S3 Requester Pays buckets in queries for the primary workgroup | false |
| primary_workgroup_selected_engine_version | string | Requested engine version for the primary workgroup | AUTO |
| stulyze_app_stack_name | string | Name of the stulyze-app CloudFormation stack | stulyze-app |
| stulyze_app_stack_disable_rollback | bool | Set to true to disable rollback of the stulyze-app stack if stack creation failed | false |
| stulyze_app_stack_template_body | string | Template body for the stulyze-app CloudFormation stack | |
| igw_02aec4b4978ee2879_vpc_id | string | VPC ID for Internet Gateway igw-02aec4b4978ee2879 | vpc-05fed6e9ac0f64a6e |

## Outputs

| Name | Description |
|------|-------------|
| primary_workgroup_name | Name of the primary Athena workgroup |
| primary_workgroup_arn | ARN of the primary Athena workgroup |
| stulyze_app_stack_id | ID of the stulyze-app CloudFormation stack |
| stulyze_app_stack_outputs | Outputs from the stulyze-app CloudFormation stack |
| internet_gateway_id | ID of the Internet Gateway |
| internet_gateway_arn | ARN of the Internet Gateway |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh terraform
```

Or for OpenTofu:

```bash
./imports.sh tofu
```

### Plan

```bash
terraform plan -var-file=environments/sg.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/sg.tfvars
```

## Notes

- This stack imports existing AWS resources. Run the import script before planning or applying
- The Internet Gateway is attached to VPC vpc-05fed6e9ac0f64a6e
- The primary Athena workgroup uses AUTO engine versioning
- CloudWatch metrics are enabled for the Athena workgroup