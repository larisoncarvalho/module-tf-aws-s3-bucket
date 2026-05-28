# taher-ubuntu-runner-stack

## Description

Azure Ubuntu runner VM with managed disk, network interface, NSG, and public IP in the test-taher resource group.

## Architecture Overview

This stack provisions a complete Azure VM environment consisting of:
- A **Public IP** address (Standard SKU, Static, Zone 1)
- A **Network Security Group** with an SSH inbound rule
- A **Network Interface** connected to an existing VNet subnet, with accelerated networking enabled
- A **Managed Disk** (Premium LRS, 30 GB) serving as the OS disk
- A **Virtual Machine** (Ubuntu 24.04 LTS, Standard_D2s_v3, Zone 1) wired to the NIC above

Cross-module wiring:
- `module.public_ip.public_ip_id` → `module.network_interface` (public_ip_address_id)
- `module.network_interface.nic_id` → `module.virtual_machine` (network_interface_id)

## Module Overview

| Module | Description |
|--------|-------------|
| `public_ip` | Manages the public IP address for the Ubuntu runner VM |
| `network_security_group` | Manages the NSG with SSH inbound rule |
| `network_interface` | Manages the NIC with accelerated networking |
| `managed_disk` | Manages the OS managed disk |
| `virtual_machine` | Manages the Ubuntu runner VM |

## Variables Reference

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | string | Azure region for the provider | — |
| `resource_group_name` | string | Name of the resource group | — |
| `location` | string | Azure region where resources exist | — |
| `vm_name` | string | Name of the virtual machine | — |
| `vm_size` | string | Size of the virtual machine | — |
| `vm_zones` | list(string) | Availability zones for the VM | — |
| `computer_name` | string | Computer name of the VM | — |
| `admin_username` | string | Admin username for the VM | — |
| `disable_password_authentication` | bool | Whether password authentication is disabled | — |
| `ssh_key_path` | string | Path for the SSH authorized keys file | — |
| `ssh_key_data` | string | Public SSH key data (sensitive) | — |
| `boot_diagnostics_enabled` | bool | Whether boot diagnostics is enabled | — |
| `boot_diagnostics_storage_uri` | string | Storage URI for boot diagnostics | — |
| `os_disk_name` | string | Name of the OS disk | — |
| `os_disk_create_option` | string | Create option for the OS disk | — |
| `os_disk_caching` | string | Caching setting for the OS disk | — |
| `vm_os_type` | string | OS type of the VM disk | — |
| `os_disk_managed_disk_type` | string | Managed disk type for the OS disk | — |
| `image_publisher` | string | Publisher of the VM image | — |
| `image_offer` | string | Offer of the VM image | — |
| `image_sku` | string | SKU of the VM image | — |
| `image_version` | string | Version of the VM image | — |
| `managed_disk_name` | string | Name of the managed disk | — |
| `managed_disk_storage_account_type` | string | Storage account type for the managed disk | — |
| `managed_disk_create_option` | string | Create option for the managed disk | — |
| `managed_disk_size_gb` | number | Size of the managed disk in GB | — |
| `managed_disk_os_type` | string | OS type of the managed disk | — |
| `nsg_name` | string | Name of the network security group | — |
| `nsg_security_rules` | list(object) | List of security rules for the NSG | `[]` |
| `public_ip_name` | string | Name of the public IP address | — |
| `public_ip_allocation_method` | string | Allocation method for the public IP | — |
| `public_ip_sku` | string | SKU of the public IP | — |
| `public_ip_version` | string | IP version of the public IP | — |
| `public_ip_zones` | list(string) | Availability zones for the public IP | — |
| `nic_name` | string | Name of the network interface | — |
| `nic_accelerated_networking_enabled` | bool | Whether accelerated networking is enabled | — |
| `nic_ip_forwarding_enabled` | bool | Whether IP forwarding is enabled | — |
| `nic_ip_config_name` | string | Name of the IP configuration | — |
| `nic_subnet_id` | string | ID of the subnet for the NIC | — |
| `nic_private_ip_address_allocation` | string | Private IP address allocation method | — |
| `nic_private_ip_address_version` | string | Private IP address version | — |
| `nic_ip_config_primary` | bool | Whether the IP configuration is primary | — |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `vm_id` | The ID of the virtual machine |
| `managed_disk_id` | The ID of the managed disk |
| `nsg_id` | The ID of the network security group |
| `public_ip_id` | The ID of the public IP address |
| `nic_id` | The ID of the network interface |

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

- `ssh_key_data` is a sensitive variable — supply it via environment variable `TF_VAR_ssh_key_data` or a secrets manager rather than storing it in tfvars.
- The `managed_disk` module imports the OS disk independently; the VM references it by name via `storage_os_disk`.
- No backend configuration is included. Configure remote state as appropriate for your environment.