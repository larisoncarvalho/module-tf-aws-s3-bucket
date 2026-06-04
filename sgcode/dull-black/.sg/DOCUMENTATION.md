# taher-ubuntu-runner-stack

## Description

Azure infrastructure for the taher-ubuntu-runner VM including managed disk, network interface, network security group, and public IP.

## Architecture Overview

This stack provisions and manages the following Azure resources:

- **Public IP** (`azurerm_public_ip`): Static Standard SKU public IP in zone 1
- **Network Security Group** (`azurerm_network_security_group`): NSG with an inbound SSH rule on port 22
- **Network Interface** (`azurerm_network_interface`): NIC with accelerated networking, attached to the public IP
- **Managed Disk** (`azurerm_managed_disk`): Premium LRS OS disk (30 GB) in zone 1
- **Virtual Machine** (`azurerm_virtual_machine`): Ubuntu 24.04 LTS Linux VM (Standard_D2s_v3) in zone 1

## Module Overview

| Module | Description |
|--------|-------------|
| `public_ip` | Manages the public IP address for the VM |
| `network_security_group` | Manages the NSG with SSH access rule |
| `network_interface` | Manages the NIC with IP configuration |
| `managed_disk` | Manages the OS managed disk |
| `virtual_machine` | Manages the Linux VM and its OS disk |

## Variables Reference

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | string | Azure region for the provider | — |
| `resource_group_name` | string | Name of the resource group | — |
| `location` | string | Azure region where resources exist | — |
| `public_ip_name` | string | Name of the public IP address | — |
| `public_ip_allocation_method` | string | Allocation method for the public IP | — |
| `public_ip_sku` | string | SKU of the public IP | — |
| `public_ip_ip_version` | string | IP version for the public IP | — |
| `public_ip_zones` | list(string) | Availability zones for the public IP | — |
| `nsg_name` | string | Name of the network security group | — |
| `nsg_security_rule_name` | string | Name of the NSG security rule | — |
| `nsg_security_rule_protocol` | string | Protocol for the NSG security rule | — |
| `nsg_security_rule_source_port_range` | string | Source port range | — |
| `nsg_security_rule_destination_port_range` | string | Destination port range | — |
| `nsg_security_rule_source_address_prefix` | string | Source address prefix | — |
| `nsg_security_rule_destination_address_prefix` | string | Destination address prefix | — |
| `nsg_security_rule_access` | string | Access setting (Allow/Deny) | — |
| `nsg_security_rule_priority` | number | Priority of the security rule | — |
| `nsg_security_rule_direction` | string | Direction (Inbound/Outbound) | — |
| `nic_name` | string | Name of the network interface | — |
| `nic_accelerated_networking_enabled` | bool | Whether accelerated networking is enabled | — |
| `nic_ip_forwarding_enabled` | bool | Whether IP forwarding is enabled | — |
| `nic_ip_config_name` | string | Name of the NIC IP configuration | — |
| `nic_subnet_id` | string | ID of the subnet for the NIC | — |
| `nic_private_ip_address_allocation` | string | Private IP allocation method | — |
| `nic_private_ip_address_version` | string | Private IP version | — |
| `nic_ip_config_primary` | bool | Whether the IP config is primary | — |
| `managed_disk_name` | string | Name of the managed disk | — |
| `managed_disk_storage_account_type` | string | Storage account type | — |
| `managed_disk_create_option` | string | Create option for the managed disk | — |
| `managed_disk_size_gb` | number | Size of the managed disk in GB | — |
| `managed_disk_os_type` | string | OS type for the managed disk | — |
| `managed_disk_zone` | string | Availability zone for the managed disk | — |
| `vm_name` | string | Name of the virtual machine | — |
| `vm_size` | string | Size of the virtual machine | — |
| `vm_zones` | list(string) | Availability zones for the VM | — |
| `vm_os_disk_name` | string | Name of the VM OS disk | — |
| `vm_os_disk_create_option` | string | Create option for the OS disk | — |
| `vm_os_disk_caching` | string | Caching setting for the OS disk | — |
| `vm_os_disk_managed_disk_type` | string | Managed disk type for the OS disk | — |
| `vm_os_type` | string | OS type for the VM | — |
| `vm_image_publisher` | string | Publisher of the VM image | — |
| `vm_image_offer` | string | Offer of the VM image | — |
| `vm_image_sku` | string | SKU of the VM image | — |
| `vm_image_version` | string | Version of the VM image | — |
| `vm_computer_name` | string | Computer name for the VM | — |
| `vm_admin_username` | string | Admin username for the VM | — |
| `vm_disable_password_authentication` | bool | Whether to disable password auth (sensitive) | null |
| `vm_ssh_key_path` | string | Path for the SSH public key on the VM | — |
| `vm_ssh_key_data` | string | SSH public key data (sensitive) | null |
| `vm_boot_diagnostics_enabled` | bool | Whether boot diagnostics is enabled | — |
| `vm_boot_diagnostics_storage_uri` | string | Storage URI for boot diagnostics | null |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `virtual_machine_id` | The ID of the virtual machine |
| `managed_disk_id` | The ID of the managed disk |
| `network_interface_id` | The ID of the network interface |
| `network_security_group_id` | The ID of the network security group |
| `public_ip_id` | The ID of the public IP address |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
./imports.sh terraform
# or with OpenTofu:
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

## Notes

- Sensitive variables (`vm_disable_password_authentication`, `vm_ssh_key_data`) must be provided at runtime via environment variables or a secrets manager — do not commit values to source control.
- The `vm_boot_diagnostics_storage_uri` defaults to `null`, which uses Azure-managed storage for boot diagnostics.
- All resources are deployed in the `eastus` region within the `test-taher` resource group.