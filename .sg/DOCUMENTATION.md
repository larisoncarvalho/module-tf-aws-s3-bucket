# Multi-Cloud Infrastructure

## Overview

This Terraform stack manages multi-cloud infrastructure spanning Azure resource group and AWS EC2 instance. The stack demonstrates cross-cloud resource management with proper isolation and configuration.

## Architecture

The stack consists of two primary modules:

### Modules

#### resource_group
Manages Azure resource group with configurable location, name, and tags.

**Resources:**
- `azurerm_resource_group.this` - Azure resource group

#### instance
Manages AWS EC2 instance with comprehensive network configuration, metadata options, CPU settings, and storage configuration.

**Resources:**
- `aws_instance.this` - EC2 instance with full configuration

## Root Module Calls

### azurenetwork
Azure resource group for network resources in East US region.

**Configuration:**
- Location: eastus
- Name: azurenetwork
- Tags: app=azurenetwork, creator=stackgurdian, environment=default

### ec2_instance
EC2 instance in eu-central-1a with t3.micro instance type.

**Configuration:**
- Instance Type: t3.micro
- Availability Zone: eu-central-1a
- Public IP: Enabled
- Monitoring: Disabled
- EBS Optimized: Disabled
- Tenancy: default
- Root Volume: gp2, delete on termination

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| ami | string | AMI ID for the instance | ami-074dd8e8dac7651a5 |
| subnet_id | string | Subnet ID for instance network interface | subnet-0b77c0d76befaf70d |
| vpc_security_group_ids | list(string) | Security group IDs to attach to the instance | ["sg-057053456dac1810d"] |
| key_name | string | SSH key pair name | ec2-key-thz89qha |

## Outputs

| Name | Description |
|------|-------------|
| azure_resource_group_id | Azure resource group ID |
| ec2_instance_id | EC2 instance ID |
| ec2_public_ip | EC2 instance public IP address |
| ec2_private_ip | EC2 instance private IP address |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS credentials configured
- Azure credentials configured
- Existing AWS VPC, subnet, and security group
- Existing EC2 key pair
- Existing EC2 instance (for import)
- Existing Azure resource group (for import)

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

3. **Review Plan:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Customization

To customize the deployment for different environments:

1. Copy `environments/terraform.tfvars` to a new file (e.g., `environments/production.tfvars`)
2. Modify the variable values as needed
3. Apply with the new var file: `terraform apply -var-file=environments/production.tfvars`

## Important Notes

- This stack imports existing cloud resources
- The Azure resource group must exist before import
- The EC2 instance must exist before import
- Ensure AWS and Azure credentials are properly configured
- The stack uses multi-region configuration (Azure: eastus, AWS: eu-central-1)
- No backend configuration is included - add as needed for your environment