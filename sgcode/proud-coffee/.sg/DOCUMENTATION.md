# StackGuardian Infrastructure

Multi-service infrastructure including ACM certificates, compute instances, networking, and IAM policies.

## Stack Overview

This Terraform configuration manages a comprehensive AWS infrastructure stack in the `eu-central-1` region, including:

- **ACM Certificate**: SSL/TLS certificate for stackguardian.io domain with wildcard SANs
- **Athena Workgroup**: Primary workgroup for Athena query execution
- **Backup Vault**: AWS Backup vault with cross-account access policy
- **Autoscaling Group**: Taher private runner with launch template
- **EC2 Instance**: Single t3.micro instance with security group
- **Network Interface**: Standalone ENI with static private IP
- **Security Group**: SSH access security group
- **VPC & Subnet**: Virtual network infrastructure
- **IAM Policy**: EBS CSI driver policy for EKS

## Modules

| Module | Description | Resources |
|--------|-------------|-----------|
| `acm_certificate` | Manages ACM certificate for stackguardian.io domain | aws_acm_certificate |
| `athena_workgroup` | Manages Athena workgroup configuration | aws_athena_workgroup |
| `backup_vault` | Manages AWS Backup vault with cross-account access policy | aws_backup_vault, aws_backup_vault_policy |
| `autoscaling_group` | Manages autoscaling group with launch template | aws_autoscaling_group |
| `instance` | Manages EC2 instance with network interface and security group | aws_instance |
| `network_interface` | Manages standalone network interface | aws_network_interface |
| `security_group` | Manages VPC security group with ingress and egress rules | aws_security_group |
| `subnet` | Manages VPC subnet | aws_subnet |
| `vpc` | Manages VPC with DHCP options | aws_vpc |
| `iam_policy` | Manages IAM policy for EBS CSI driver | aws_iam_policy |

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | string | AWS region for resources | `"eu-central-1"` |
| `backup_vault_kms_key_arn` | string | KMS key ARN for backup vault encryption | - |
| `taher_runner_subnet_id` | string | Subnet ID for Taher runner autoscaling group | - |
| `taher_runner_launch_template_id` | string | Launch template ID for Taher runner | - |
| `autoscaling_service_linked_role_arn` | string | Service-linked role ARN for autoscaling | - |
| `instance_ami_id` | string | AMI ID for EC2 instance | - |
| `instance_key_name` | string | SSH key name for EC2 instance | - |
| `instance_security_group_id` | string | Security group ID for EC2 instance | - |
| `instance_subnet_id` | string | Subnet ID for EC2 instance | - |
| `eni_subnet_id` | string | Subnet ID for network interface | - |
| `eni_security_group_id` | string | Security group ID for network interface | - |
| `vpc_id` | string | VPC ID for resources | - |

## Outputs

| Name | Description |
|------|-------------|
| `certificate_arn` | ARN of the ACM certificate |
| `workgroup_id` | ID of the Athena workgroup |
| `backup_vault_arn` | ARN of the backup vault |
| `asg_id` | ID of the autoscaling group |
| `instance_id` | ID of the EC2 instance |
| `network_interface_id` | ID of the network interface |
| `security_group_id` | ID of the security group |
| `subnet_id` | ID of the subnet |
| `vpc_id` | ID of the VPC |
| `ebs_csi_policy_arn` | ARN of the EBS CSI IAM policy |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh terraform
```

### Plan Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- This configuration imports existing AWS resources
- All resources are configured to match current state (zero-drift goal)
- The backup vault policy allows cross-account access from organization `o-ohixe8qfps`
- The autoscaling group uses a launch template for instance configuration
- The security group allows SSH access from any IP (0.0.0.0/0)