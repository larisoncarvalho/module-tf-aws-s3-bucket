# VPC Endpoint S3 Stack

## Overview

This stack manages a VPC endpoint for S3 gateway access in the eu-central-1 region. It provides secure, private connectivity between your VPC and Amazon S3 without requiring an internet gateway or NAT device.

## Architecture

The stack consists of a single module that creates an AWS VPC endpoint configured as a Gateway type for S3 service access.

### Modules

#### vpc_endpoint

Manages VPC endpoint for S3 service with the following capabilities:

- Creates a Gateway-type VPC endpoint for S3
- Associates the endpoint with multiple route tables
- Applies IAM policy for endpoint access control
- Supports custom tagging

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| vpc_id | string | VPC ID for the endpoint | vpc-0119b9388f2104572 |
| route_table_ids | list(string) | Route table IDs to associate with the endpoint | See terraform.tfvars |

### Module Variables (vpc_endpoint)

| Name | Type | Description |
|------|------|-------------|
| vpc_id | string | VPC ID for the endpoint |
| service_name | string | AWS service name for the endpoint |
| vpc_endpoint_type | string | Type of VPC endpoint |
| route_table_ids | list(string) | Route table IDs to associate with the endpoint |
| policy | string | IAM policy document for the endpoint |
| tags | map(string) | Resource tags |

## Outputs

| Name | Description |
|------|-------------|
| vpc_endpoint_id | VPC endpoint ID |

## Usage

### Prerequisites

- AWS credentials configured
- Terraform installed
- Existing VPC and route tables

### Deployment Steps

1. **Initialize Terraform**

```bash
terraform init
```

2. **Import Existing Resources**

```bash
chmod +x imports.sh
./imports.sh
```

3. **Review Changes**

```bash
terraform plan -var-file=environments/terraform.tfvars
```

After import, this should show no changes (zero drift).

4. **Apply Configuration**

```bash
terraform apply -var-file=environments/terraform.tfvars
```

### Configuration

The S3 endpoint is configured with:

- **Service**: com.amazonaws.eu-central-1.s3
- **Type**: Gateway
- **Policy**: Allow all principals and actions (open policy)
- **Route Tables**: 6 route tables associated
- **Tags**: Name=s3, Resource-Type=prod

### Customization

To modify the configuration:

1. Update values in `environments/terraform.tfvars`
2. For policy changes, edit the `policy` argument in `main.tf`
3. Run `terraform plan` to preview changes
4. Apply with `terraform apply`

## Resource Details

### VPC Endpoint

- **Resource**: aws_vpc_endpoint.this
- **Import ID**: vpce-0371ef401a7f5e268
- **Type**: Gateway
- **Service**: S3 (eu-central-1)

The endpoint provides private connectivity to S3, routing traffic through AWS's internal network rather than the public internet.

## Notes

- Gateway endpoints for S3 are free of charge
- The endpoint policy allows unrestricted access; consider tightening for production use
- Route table associations enable automatic routing to S3 through the endpoint
- Changes to route_table_ids will update the endpoint associations