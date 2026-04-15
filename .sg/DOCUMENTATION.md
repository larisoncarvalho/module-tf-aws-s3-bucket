# VPC Endpoint S3 Stack

## Overview

This stack manages a VPC endpoint for AWS S3 service access in the eu-central-1 region. It creates a Gateway-type VPC endpoint that allows private connectivity to S3 from within the VPC without requiring an internet gateway.

## Architecture

The stack consists of a single reusable module:

### Module: vpc_endpoint

Manages VPC endpoints for AWS services. This module creates and configures a VPC endpoint with the specified service, type, and routing configuration.

**Resources:**
- `aws_vpc_endpoint.this` - VPC endpoint resource

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| vpc_id | string | VPC ID | vpc-0119b9388f2104572 |
| route_table_ids | list(string) | Route table IDs | 6 route tables |

### Module Variables (vpc_endpoint)

| Name | Type | Description |
|------|------|-------------|
| vpc_id | string | VPC ID where the endpoint will be created |
| service_name | string | AWS service name for the VPC endpoint |
| vpc_endpoint_type | string | Type of VPC endpoint (Gateway or Interface) |
| route_table_ids | list(string) | Route table IDs to associate with the endpoint |
| policy | string | IAM policy document for the VPC endpoint |
| private_dns_enabled | bool | Whether to enable private DNS for the endpoint |
| tags | map(string) | Tags to apply to the VPC endpoint |

## Outputs

| Name | Description |
|------|-------------|
| vpc_endpoint_id | VPC endpoint ID |
| vpc_endpoint_state | VPC endpoint state |

## Usage

### Prerequisites

- AWS credentials configured
- Terraform installed
- Existing VPC and route tables

### Deployment Steps

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Import Existing Resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Review Changes:**
   ```bash
   terraform plan -var-file environments/terraform.tfvars
   ```

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file environments/terraform.tfvars
   ```

### Configuration

The S3 VPC endpoint is configured as a Gateway endpoint with:
- Service: `com.amazonaws.eu-central-1.s3`
- Type: Gateway
- Policy: Allow all actions (open policy)
- Private DNS: Disabled (not applicable for Gateway endpoints)
- Associated with 6 route tables

### Customization

To modify the configuration:

1. Update values in `environments/terraform.tfvars`
2. For policy changes, edit the `policy` argument in `main.tf`
3. Run `terraform plan` to preview changes
4. Apply with `terraform apply`

## Notes

- This configuration imports an existing VPC endpoint (vpce-0371ef401a7f5e268)
- Gateway endpoints for S3 do not support private DNS
- The policy allows unrestricted access - consider tightening for production use
- Route table associations enable S3 access from subnets using those route tables