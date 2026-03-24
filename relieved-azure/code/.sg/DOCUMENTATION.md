# ext-approval-qa-instance

EC2 instance for external approval service in QA environment

## Overview

This stack manages an EC2 instance configured for the external approval service in the QA environment. The instance is deployed in the eu-central-1 region with comprehensive network, IAM, and metadata configuration.

## Modules

### instance

Manages EC2 instance with network and IAM configuration.

**Resources:**
- `aws_instance.this` - EC2 instance with full configuration including metadata options, enclave settings, and capacity reservations

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region for resource deployment | - |
| subnet_id | string | Subnet ID for instance network interface | - |
| security_group_ids | list(string) | Security group IDs to attach to instance | - |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the external approval QA instance |
| private_ip | Private IP address of the external approval QA instance |
| public_ip | Public IP address of the external approval QA instance |

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

## Instance Configuration

The EC2 instance is configured with:
- **AMI:** ami-00266546a4aac405e
- **Instance Type:** t3.micro
- **Availability Zone:** eu-central-1a
- **IAM Profile:** sg-external-approval-ec2-qa
- **Public IP:** Enabled
- **Metadata Service:** IMDSv2 required (http_tokens: required)
- **CPU Configuration:** 1 core, 2 threads per core
- **Monitoring:** Basic monitoring
- **Tenancy:** Default

## Security

- Metadata service configured to require IMDSv2 tokens
- Instance profile attached for IAM role-based access
- Security groups control network access
- Root volume configured for deletion on termination

## Tags

All resources are tagged with:
- Name: ext-approval-qa
- Project: sg-external-approval
- Environment: qa
- ManagedBy: terraform