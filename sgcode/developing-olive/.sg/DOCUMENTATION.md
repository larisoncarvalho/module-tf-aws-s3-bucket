# vpc_name_stack

## Description

AWS VPC infrastructure for vpc_name in eu-central-1.

## Module Overview

| Module | Description | Source |
|--------|-------------|--------|
| vpc | Manages the aws_vpc resource | ./modules/vpc |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region where resources will be managed | — |
| cidr_block | string | The IPv4 CIDR block for the VPC | — |
| instance_tenancy | string | Tenancy option for instances launched into the VPC | — |
| tags | map(string) | Tags to assign to the VPC | — |

## Outputs Reference

| Name | Description |
|------|-------------|
| vpc_id | The ID of the VPC |
| dhcp_options_id | DHCP options ID of the VPC |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
./imports.sh terraform
# or for OpenTofu:
./imports.sh tofu
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```