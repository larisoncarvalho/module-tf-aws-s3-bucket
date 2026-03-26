# Azure Subnet Infrastructure

## Overview

This Terraform stack manages Azure virtual network subnet configuration. It provides a reusable module for creating and managing subnets with configurable network policies.

## Stack Information

- **Name**: azure-subnet-infrastructure
- **Description**: Azure subnet configuration
- **Region**: global

## Modules

### subnet

Manages Azure virtual network subnet with configurable network policies for private endpoints and private link services.

**Location**: `modules/subnet/`

**Resources**:
- `azurerm_subnet.this` - Azure subnet resource

## Variables

No root-level variables are required. All configuration values are hardcoded in `main.tf`.

## Outputs

| Name | Description | Source |
|------|-------------|--------|
| subnet1_id | ID of subnet1 | module.subnet1.id |
| subnet1_name | Name of subnet1 | module.subnet1.name |

## Module: subnet

### Variables

| Name | Type | Description | Required |
|------|------|-------------|----------|
| subnet_name | string | Name of the subnet | Yes |
| resource_group_name | string | Name of the resource group | Yes |
| virtual_network_name | string | Name of the virtual network | Yes |
| address_prefixes | list(string) | Address prefixes for the subnet | Yes |
| default_outbound_access_enabled | bool | Enable default outbound access | Yes |
| private_endpoint_network_policies_enabled | bool | Enable private endpoint network policies | Yes |
| private_link_service_network_policies_enabled | bool | Enable private link service network policies | Yes |

### Outputs

| Name | Description |
|------|-------------|
| id | ID of the subnet |
| name | Name of the subnet |

## Usage

### Prerequisites

- Terraform >= 1.0
- Azure CLI configured with appropriate credentials
- Existing resource group: `afsff`
- Existing virtual network: `sfadf`

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
   terraform plan
   ```
   
   After import, this should show no changes (zero drift).

4. **Apply Configuration**
   ```bash
   terraform apply
   ```

### Configuration

The stack is configured to manage a single subnet with the following settings:

- **Subnet Name**: subnet1
- **Resource Group**: afsff
- **Virtual Network**: sfadf
- **Address Prefix**: 10.100.1.0/24
- **Default Outbound Access**: Enabled
- **Private Endpoint Network Policies**: Enabled
- **Private Link Service Network Policies**: Enabled

All values are hardcoded in `main.tf` for this specific deployment.

## Notes

- This stack imports an existing Azure subnet
- The configuration is designed for zero drift - no changes should be shown after import
- Network policies are enabled for both private endpoints and private link services