# Azure Resource Groups and Network

## Overview

This Terraform stack manages Azure resource groups with a virtual network and subnets. It imports existing Azure infrastructure to enable infrastructure-as-code management without recreating resources.

## Stack Description

The stack provisions:
- Multiple Azure resource groups with configurable locations and tags
- A virtual network with customizable address space
- Multiple subnets within the virtual network

## Modules

### resource_group

Manages Azure resource groups with configurable locations and tags.

**Resources:**
- `azurerm_resource_group.this` - Resource groups (for_each)

**Inputs:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| resource_groups | map(object) | Resource groups to create with location and tags | yes |

**Outputs:**

| Name | Description |
|------|-------------|
| resource_group_names | Map of resource group names |
| resource_group_ids | Map of resource group IDs |

### virtual_network

Manages Azure virtual network with subnets.

**Resources:**
- `azurerm_virtual_network.this` - Virtual network
- `azurerm_subnet.this` - Subnets (for_each)

**Inputs:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| virtual_network_name | string | Name of the virtual network | yes |
| location | string | Azure region for the virtual network | yes |
| resource_group_name | string | Resource group name for the virtual network | yes |
| address_prefixes | list(string) | Address space for the virtual network | yes |
| tags | map(string) | Tags for the virtual network | yes |
| subnets | map(object) | Subnets to create in the virtual network | no |

**Outputs:**

| Name | Description |
|------|-------------|
| virtual_network_id | ID of the virtual network |
| virtual_network_name | Name of the virtual network |
| subnet_ids | Map of subnet IDs |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | Azure region for resources | eastus |
| resource_groups | map(object) | Map of resource groups to create | See terraform.tfvars |
| subnets | map(object) | Map of subnets to create | See terraform.tfvars |

## Root Outputs

| Name | Description |
|------|-------------|
| resource_group_names | Names of created resource groups |
| virtual_network_id | ID of the virtual network |
| subnet_ids | IDs of created subnets |

## Usage

### Initialize Terraform

```bash
terraform init
```

### Import Existing Resources

Before running plan or apply, import the existing Azure resources:

```bash
chmod +x imports.sh
./imports.sh
```

This will import:
- 3 resource groups (azurenetwork, azurestack101, azurestackoct11)
- 1 virtual network (azurenetworknet)
- 3 subnets (subnet1, subnet2, subnet3)

### Plan Changes

```bash
terraform plan -var-file=environments/terraform.tfvars
```

After import, this should show no changes (zero drift).

### Apply Configuration

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- The stack is configured for the `eastus` region
- All resources are imported from existing Azure infrastructure
- Subnet address prefixes are currently empty and should be configured based on actual Azure subnet configurations
- The virtual network uses address space `10.0.0.0/16`
- Ensure you have appropriate Azure credentials configured before running Terraform commands