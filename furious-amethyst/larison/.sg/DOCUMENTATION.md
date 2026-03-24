# EC2 Instance Infrastructure

## Overview

This Terraform stack manages EC2 instance infrastructure with comprehensive network configuration in the `eu-central-1` region. The infrastructure includes a single EC2 instance with detailed configuration for compute, networking, metadata service, and storage options.

## Stack Description

**Name:** ec2-instance-infrastructure  
**Region:** eu-central-1  
**Description:** EC2 instance infrastructure with network configuration

## Architecture

The stack consists of one module:

### Module: ec2_instance

**Purpose:** Manages EC2 instance with associated network interface and EBS volume

**Resources:**
- `aws_instance.this` - EC2 instance with comprehensive configuration including CPU settings, metadata options, enclave support, and capacity reservations

## Module Details

### ec2_instance Module

This module provides a fully-configured EC2 instance with the following capabilities:

- **Compute Configuration:** Customizable instance type, CPU core count, and threads per core
- **Network Configuration:** VPC subnet placement, security groups, private IP assignment, and source/destination checking
- **Storage:** Configurable root volume type with deletion policy
- **Metadata Service:** IMDSv2 support with configurable endpoint settings
- **Advanced Features:** Hibernation support, AWS Nitro Enclaves, capacity reservations
- **Monitoring:** Optional detailed CloudWatch monitoring
- **Security:** Configurable metadata service settings for enhanced security

#### Inputs

| Name | Type | Description | Required |
|------|------|-------------|----------|
| ami_id | string | AMI ID for the instance | Yes |
| instance_type | string | EC2 instance type | Yes |
| availability_zone | string | Availability zone for the instance | Yes |
| key_name | string | SSH key pair name | Yes |
| subnet_id | string | VPC subnet ID | Yes |
| security_group_ids | list(string) | List of security group IDs | Yes |
| private_ip | string | Private IP address | Yes |
| source_dest_check | bool | Enable source/destination checking | Yes |
| ebs_optimized | bool | Enable EBS optimization | Yes |
| monitoring | bool | Enable detailed monitoring | Yes |
| tenancy | string | Instance tenancy | Yes |
| cpu_core_count | number | Number of CPU cores | Yes |
| cpu_threads_per_core | number | Number of threads per CPU core | Yes |
| hibernation | bool | Enable hibernation | Yes |
| enclave_enabled | bool | Enable AWS Nitro Enclaves | Yes |
| capacity_reservation_preference | string | Capacity reservation preference | Yes |
| metadata_http_endpoint | string | Metadata service HTTP endpoint state | Yes |
| metadata_http_tokens | string | Metadata service HTTP tokens requirement | Yes |
| metadata_http_put_response_hop_limit | number | Metadata service HTTP PUT response hop limit | Yes |
| metadata_http_protocol_ipv6 | string | Metadata service IPv6 endpoint state | Yes |
| metadata_instance_tags | string | Metadata service instance tags access | Yes |
| root_volume_type | string | Root volume type | Yes |
| root_delete_on_termination | bool | Delete root volume on instance termination | Yes |
| tags | map(string) | Resource tags | Yes |

#### Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| private_ip | Private IP address of the instance |
| availability_zone | Availability zone of the instance |

## Root Module Configuration

### Module Calls

**taher_private_runner_ubuntu:**
- Ubuntu-based EC2 instance configured as a private runner
- Instance type: t2.medium (2 vCPUs, 4 GiB RAM)
- AMI: ami-03250b0e01c28d196
- Availability zone: eu-central-1a
- Private IP: 10.0.0.52
- IMDSv2 required for enhanced security
- Root volume: gp2 with delete on termination

### Variables

| Name | Type | Description | Default Value |
|------|------|-------------|---------------|
| region | string | AWS region | eu-central-1 |
| subnet_id | string | VPC subnet ID | subnet-072669658da496c4a |
| security_group_ids | list(string) | List of security group IDs | ["sg-092a5ff991a0802bc"] |
| root_volume_type | string | Root volume type | gp2 |

### Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| private_ip | Private IP address of the instance |

## Usage

### Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- Access to the target AWS account and region (eu-central-1)
- Existing VPC infrastructure (subnet and security group)

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

3. **Review Configuration:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Post-Import Verification

After running the import script, verify that Terraform recognizes the existing infrastructure:

```bash
terraform plan -var-file=environments/terraform.tfvars
```

The output should show **no changes** required, confirming zero drift between the imported state and the configuration.

## Security Considerations

- **IMDSv2 Enforcement:** The instance is configured with `http_tokens = "required"` to enforce IMDSv2, preventing SSRF attacks
- **Metadata Hop Limit:** Set to 2 to restrict metadata service access
- **Source/Destination Checking:** Enabled for network security
- **Root Volume:** Configured to delete on termination to prevent data leakage

## Maintenance

### Modifying Instance Configuration

To modify instance settings:

1. Update the relevant variables in `environments/terraform.tfvars`
2. Run `terraform plan` to review changes
3. Apply changes with `terraform apply`

### Adding Additional Instances

To add more instances:

1. Add a new module call in `main.tf`
2. Define any new variables in `variables.tf` and `environments/terraform.tfvars`
3. Add corresponding outputs in `outputs.tf`
4. Run terraform plan and apply

## Troubleshooting

### Import Failures

If the import script fails:
- Verify the instance ID exists: `i-0a0ca27d00e7e74b9`
- Ensure AWS credentials have appropriate permissions
- Check that the region is set correctly (eu-central-1)

### Plan Shows Changes After Import

If `terraform plan` shows changes after import:
- Review the differences carefully
- Verify that all configuration values match the actual resource
- Check for computed attributes that Terraform manages automatically

## Support

For issues or questions regarding this infrastructure:
1. Review the Terraform AWS provider documentation
2. Check AWS EC2 documentation for instance configuration options
3. Verify network configuration (VPC, subnet, security groups) exists and is accessible