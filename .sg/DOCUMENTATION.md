# VPC Subnet Infrastructure

## Overview

This Terraform stack manages VPC subnet configuration in AWS. It creates and manages a single subnet within an existing VPC with configurable networking parameters.

## Stack Information

- **Name**: vpc-subnet-infrastructure
- **Description**: VPC subnet configuration
- **Region**: eu-central-1
- **Provider**: AWS (~> 5.0)

## Modules

### subnet

Manages VPC subnet configuration.

**Resources:**
- `aws_subnet.this` - VPC subnet resource

**Module Path:** `./modules/subnet`

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | "eu-central-1" |
| vpc_id | string | VPC ID | "vpc-0d6ebb61b4bccfa8a" |

## Outputs

| Name | Description | Source |
|------|-------------|--------|
| subnet_id | The ID of the subnet | module.pa_test_public_subnet.subnet_id |
| subnet_availability_zone | The availability zone of the subnet | module.pa_test_public_subnet.availability_zone |

## Module Instances

### pa_test_public_subnet

Creates a public subnet in availability zone eu-central-1b.

**Configuration:**
- CIDR Block: 10.0.2.0/24
- Availability Zone: eu-central-1b
- Public IP on Launch: Enabled
- IPv6 on Creation: Disabled
- Tags: Name = "PA-TEst-public-eu-central-1b"

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

Before applying changes, import the existing subnet:

```bash
chmod +x imports.sh
./imports.sh
```

### Plan Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Import Details

This stack imports an existing AWS subnet resource. The import script (`imports.sh`) contains the necessary commands to import the subnet into Terraform state management.

**Imported Resource:**
- Subnet ID: subnet-00374c7edd383316b
- Terraform Address: module.pa_test_public_subnet.aws_subnet.this

## Notes

- This configuration imports existing infrastructure. After import, `terraform plan` should show zero changes.
- The subnet is configured as a public subnet with automatic public IP assignment enabled.
- IPv6 address assignment is disabled for this subnet.
- Ensure the VPC (vpc-0d6ebb61b4bccfa8a) exists before applying this configuration.