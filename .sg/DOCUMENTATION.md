# Azure Multi-Resource Group Network Infrastructure

## Overview

This Terraform stack manages Azure infrastructure across multiple resource groups, including virtual networks, network security groups, public IPs, and network interfaces. The infrastructure is designed to import and manage existing Azure resources with zero drift.

## Stack Description

The stack provisions and manages:
- 5 Azure resource groups across different regions
- 2 virtual networks with address spaces
- 1 network security group with custom security rules
- 1 public IP address
- 1 network interface with security group association

## Architecture

### Modules

#### resource_group
Manages Azure resource groups with configurable location and tags.

**Resources:**
- `azurerm_resource_group`

**Outputs:**
- `name` - Resource group name
- `location` - Resource group location

#### virtual_network
Manages Azure virtual networks with configurable address spaces.

**Resources:**
- `azurerm_virtual_network`

**Outputs:**
- `id` - Virtual network ID
- `name` - Virtual network name

#### network_security_group
Manages network security groups with dynamic security rules.

**Resources:**
- `azurerm_network_security_group`
- `azurerm_network_security_rule` (for_each)

**Outputs:**
- `id` - Network security group ID
- `name` - Network security group name

#### public_ip
Manages Azure public IP addresses with configurable allocation methods.

**Resources:**
- `azurerm_public_ip`

**Outputs:**
- `id` - Public IP ID
- `ip_address` - Public IP address value

#### network_interface
Manages network interfaces with IP configurations and security group associations.

**Resources:**
- `azurerm_network_interface`
- `azurerm_network_interface_security_group_association`

**Outputs:**
- `id` - Network interface ID
- `mac_address` - Network interface MAC address

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | Azure region for resource deployment | "eastus" |
| germanywestcentral_region | string | Germany West Central region | "germanywestcentral" |
| jo_test_resource_group | string | Jo test resource group name | "jo-test" |
| jo_vnet_subnet2_id | string | Jo VNet subnet2 ID | (full resource ID) |

## Outputs

| Name | Description |
|------|-------------|
| azurenetwork_rg_name | Azure network resource group name |
| azurenetworknet_vnet_id | Azure network virtual network ID |
| acctvnet2_vnet_id | Acctvnet2 virtual network ID |
| vm_name_nsg_id | VM network security group ID |
| vm_name_pip_0_ip | VM public IP address |
| vm_name_nic_0_id | VM network interface ID |

## Usage

### Prerequisites

- Terraform >= 1.0
- Azure CLI configured with appropriate credentials
- Existing Azure subscription with resources to import

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
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply Configuration**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Import Process

The `imports.sh` script imports all existing Azure resources into Terraform state. This ensures zero drift between the actual infrastructure and Terraform's state.

## Security Considerations

- Network security group rules are configured to allow SSH (port 22) from all sources - review and restrict as needed
- Public IP addresses use dynamic allocation
- No credentials or secrets are hardcoded in the configuration
- All sensitive values should be managed through Azure Key Vault or environment variables

## Maintenance

- Review security group rules regularly
- Monitor public IP allocations
- Keep resource tags up to date for cost tracking
- Validate network interface associations after changes

## Support

For issues or questions regarding this infrastructure stack, consult the Azure documentation or contact your infrastructure team.