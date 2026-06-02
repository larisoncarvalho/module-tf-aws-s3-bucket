# taher-private-runner-infrastructure

EC2 instance with associated networking and storage resources

## Stack Overview

This stack provisions a complete EC2 infrastructure including:
- VPC with DNS support and hostnames enabled
- Subnet with IPv4 and IPv6 CIDR blocks
- Security group with ingress/egress rules
- SSH key pair
- EC2 instance with EBS-optimized root volume

**Region:** eu-central-1

## Modules

### instance

EC2 instance with EBS volume, key pair, security group, subnet, VPC, and network interface

**Resources:**
- `aws_vpc.this` - VPC with configurable CIDR and tenancy
- `aws_subnet.this` - Subnet with IPv4/IPv6 support
- `aws_security_group.this` - Security group with all traffic allowed
- `aws_key_pair.this` - SSH key pair for instance access
- `aws_instance.this` - EC2 instance with metadata options and root volume configuration

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |
| key_pair_public_key | string | Public key material for taher-private-runner key pair | - |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| instance_private_ip | Private IP address of the EC2 instance |
| vpc_id | ID of the VPC |
| subnet_id | ID of the subnet |

## Usage

### Prerequisites

- OpenTofu/Terraform installed
- AWS credentials configured
- Public key material for SSH access

### Initialization

```bash
tofu init
```

### Import Existing Resources

Before applying changes, import the existing infrastructure:

```bash
chmod +x imports.sh
./imports.sh tofu
```

### Plan

Review changes before applying:

```bash
tofu plan -var-file environments/sg.tfvars
```

### Apply

Provision the infrastructure:

```bash
tofu apply -var-file environments/sg.tfvars
```

## Configuration

Edit `environments/sg.tfvars` to customize:
- `region` - AWS region for deployment
- `key_pair_public_key` - SSH public key material (sensitive)

All other configuration values are hardcoded in `main.tf` as they are consistent across environments.