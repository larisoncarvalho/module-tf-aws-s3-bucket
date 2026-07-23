# Internet Gateway Infrastructure

Manages internet gateway and VPC connectivity in eu-central-1.

## Stack Overview

This stack provisions an internet gateway attached to an existing VPC, enabling internet connectivity for resources within the VPC.

## Modules

### internet_gateway

Manages internet gateway attached to VPC.

**Resources:**
- `aws_internet_gateway.this` - Internet gateway resource

**Inputs:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| vpc_id | string | VPC ID to attach the internet gateway to | yes |
| tags | map(string) | Tags to apply to the internet gateway | yes |

**Outputs:**

| Name | Description |
|------|-------------|
| id | Internet gateway ID |
| arn | Internet gateway ARN |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| vpc_id | string | VPC ID to attach the internet gateway to | vpc-0d42c0c0bcf5e9d7e |

## Root Outputs

| Name | Description |
|------|-------------|
| internet_gateway_id | Internet gateway ID |
| internet_gateway_arn | Internet gateway ARN |

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
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

This stack imports an existing internet gateway. After import, `terraform plan` should show no changes, indicating zero drift from the actual infrastructure state.