# IAM Roles and Subnet Infrastructure

## Overview

This Terraform stack manages IAM roles for Lambda/Edge Lambda functions and VPC subnet infrastructure in the eu-central-1 region.

## Stack Components

### Modules

#### iam_role
Manages IAM roles with inline policies for Lambda functions. Each role includes:
- Assume role policy for Lambda and Edge Lambda services
- Configurable inline policies for CloudWatch Logs and S3 access
- Customizable session duration and path

#### subnet
Manages VPC subnets with IPv4 and IPv6 CIDR block support. Features include:
- IPv4 and IPv6 CIDR configuration
- Availability zone placement
- Public IP mapping control
- Custom tagging

### Resources

This stack manages:
- 5 IAM roles for Lambda functions (0eu096k-9ci2y0p, 0eu096k-ing4i1, 1z1sf45-3rieapj, 1z1sf45-zflgrfp, 498i03-s0g5wv)
- 5 inline IAM policies (one per role)
- 1 VPC subnet (user-data)

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |

## Outputs

| Name | Description |
|------|-------------|
| role_0eu096k_9ci2y0p_id | ID of IAM role 0eu096k-9ci2y0p |
| role_0eu096k_ing4i1_id | ID of IAM role 0eu096k-ing4i1 |
| role_1z1sf45_3rieapj_id | ID of IAM role 1z1sf45-3rieapj |
| role_1z1sf45_zflgrfp_id | ID of IAM role 1z1sf45-zflgrfp |
| role_498i03_s0g5wv_id | ID of IAM role 498i03-s0g5wv |
| user_data_subnet_id | ID of user-data subnet |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

Import all existing AWS resources into Terraform state:

```bash
chmod +x imports.sh
./imports.sh
```

### Plan Changes

Review the execution plan to ensure zero drift:

```bash
terraform plan -var-file=environments/terraform.tfvars
```

After import, this should show no changes.

### Apply Configuration

Apply any future changes:

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## IAM Role Permissions

All Lambda roles include:
- CloudWatch Logs: CreateLogGroup, CreateLogStream, PutLogEvents
- S3: GetObject, PutObject on xstack-landing-nonprod bucket

## Subnet Configuration

The user-data subnet is configured with:
- VPC: vpc-0119b9388f2104572
- IPv4 CIDR: 10.0.0.128/27
- IPv6 CIDR: 2a05:d014:190:c680::/64
- Availability Zone: eu-central-1a
- Public IP mapping: Disabled
- IPv6 auto-assignment: Disabled

## Notes

- This configuration imports existing resources and should maintain zero drift
- All IAM roles use the same assume role policy for Lambda/Edge Lambda
- The subnet supports both IPv4 and IPv6 addressing