# IAM Policies Stack

## Overview

This stack manages IAM policies for private runner S3 access and role assumption. It creates two IAM policies:

1. **Neha_Private_Runner-runner-s3-policy**: Grants S3 permissions for the private runner storage backend
2. **Neha_Private_Runner-ec2-runner-assume-s3-role-policy**: Allows EC2 runners to assume the S3 role

## Architecture

The stack consists of a single reusable module:

- **iam_policy**: Creates IAM policies from a map of policy definitions

## Module: iam_policy

### Resources

- `aws_iam_policy.this`: IAM policies (for_each over var.policies)

### Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| policies | map(object) | IAM policies to create | {} |

### Outputs

| Name | Description |
|------|-------------|
| policy_arns | ARNs of created IAM policies |
| policy_ids | IDs of created IAM policies |

## Root Configuration

### Variables

| Name | Type | Description |
|------|------|-------------|
| region | string | AWS region |
| policies | map(object) | IAM policies to create |

### Outputs

| Name | Description |
|------|-------------|
| policy_arns | ARNs of created IAM policies |
| policy_ids | IDs of created IAM policies |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Policy Details

### S3 Policy Permissions

The runner S3 policy grants the following permissions on bucket `7ungwu6v-private-runner-storage-backend`:

- Object operations: Get, Put, Delete
- Tagging operations: Get, Put, Delete (object and version)
- Versioning operations: Get, Delete versions
- Bucket operations: ListBucket

### Role Assumption Policy

The EC2 runner assume role policy allows assuming role:
- `arn:aws:iam::790543352839:role/Neha_Private_Runner-private-runner-s3-role`

## Notes

- This stack imports existing IAM policies
- Region is set to `us-east-1` (IAM is global but region is required for provider)
- After import, `terraform plan` should show zero changes