variable "region" {
  type        = string
  description = "Azure region for the provider"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where resources exist"
}

variable "public_ip_name" {
  type        = string
  description = "Name of the public IP address"
}

variable "public_ip_allocation_method" {
  type        = string
  description = "Allocation method for the public IP"
}

variable "public_ip_sku" {
  type        = string
  description = "SKU of the public IP"
}

variable "public_ip_ip_version" {
  type        = string
  description = "IP version for the public IP"
}

variable "public_ip_zones" {
  type        = list(string)
  description = "Availability zones for the public IP"
}

variable "nsg_name" {
  type        = string
  description = "Name of the network security group"
}

variable "nsg_security_rule_name" {
  type        = string
  description = "Name of the NSG security rule"
}

variable "nsg_security_rule_protocol" {
  type        = string
  description = "Protocol for the NSG security rule"
}

variable "nsg_security_rule_source_port_range" {
  type        = string
  description = "Source port range for the NSG security rule"
}

variable "nsg_security_rule_destination_port_range" {
  type        = string
  description = "Destination port range for the NSG security rule"
}

variable "nsg_security_rule_source_address_prefix" {
  type        = string
  description = "Source address prefix for the NSG security rule"
}

variable "nsg_security_rule_destination_address_prefix" {
  type        = string
  description = "Destination address prefix for the NSG security rule"
}

variable "nsg_security_rule_access" {
  type        = string
  description = "Access setting for the NSG security rule"
}

variable "nsg_security_rule_priority" {
  type        = number
  description = "Priority of the NSG security rule"
}

variable "nsg_security_rule_direction" {
  type        = string
  description = "Direction of the NSG security rule"
}

variable "nic_name" {
  type        = string
  description = "Name of the network interface"
}

variable "nic_accelerated_networking_enabled" {
  type        = bool
  description = "Whether accelerated networking is enabled on the NIC"
}

variable "nic_ip_forwarding_enabled" {
  type        = bool
  description = "Whether IP forwarding is enabled on the NIC"
}

variable "nic_ip_config_name" {
  type        = string
  description = "Name of the NIC IP configuration"
}

variable "nic_subnet_id" {
  type        = string
  description = "ID of the subnet for the NIC"
}

variable "nic_private_ip_address_allocation" {
  type        = string
  description = "Private IP address allocation method for the NIC"
}

variable "nic_private_ip_address_version" {
  type        = string
  description = "Private IP address version for the NIC"
}

variable "nic_ip_config_primary" {
  type        = bool
  description = "Whether the NIC IP configuration is primary"
}

variable "managed_disk_name" {
  type        = string
  description = "Name of the managed disk"
}

variable "managed_disk_storage_account_type" {
  type        = string
  description = "Storage account type for the managed disk"
}

variable "managed_disk_create_option" {
  type        = string
  description = "Create option for the managed disk"
}

variable "managed_disk_size_gb" {
  type        = number
  description = "Size of the managed disk in GB"
}

variable "managed_disk_os_type" {
  type        = string
  description = "OS type for the managed disk"
}

variable "managed_disk_zone" {
  type        = string
  description = "Availability zone for the managed disk"
}

variable "managed_disk_hyper_v_generation" {
  type        = string
  description = "Hyper-V generation for the managed disk"
}

variable "managed_disk_image_reference_id" {
  type        = string
  description = "Image reference ID for the managed disk"
}

variable "managed_disk_trusted_launch_enabled" {
  type        = bool
  description = "Whether trusted launch is enabled for the managed disk"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
}

variable "vm_zones" {
  type        = list(string)
  description = "Availability zones for the virtual machine"
}

variable "vm_os_disk_name" {
  type        = string
  description = "Name of the VM OS disk"
}

variable "vm_os_disk_create_option" {
  type        = string
  description = "Create option for the VM OS disk"
}

variable "vm_os_disk_caching" {
  type        = string
  description = "Caching setting for the VM OS disk"
}

variable "vm_os_disk_managed_disk_type" {
  type        = string
  description = "Managed disk type for the VM OS disk"
}

variable "vm_os_type" {
  type        = string
  description = "OS type for the VM"
}

variable "vm_image_publisher" {
  type        = string
  description = "Publisher of the VM image"
}

variable "vm_image_offer" {
  type        = string
  description = "Offer of the VM image"
}

variable "vm_image_sku" {
  type        = string
  description = "SKU of the VM image"
}

variable "vm_image_version" {
  type        = string
  description = "Version of the VM image"
}

variable "vm_computer_name" {
  type        = string
  description = "Computer name for the VM"
}

variable "vm_admin_username" {
  type        = string
  description = "Admin username for the VM"
}

variable "vm_disable_password_authentication" {
  type        = bool
  description = "Whether to disable password authentication on the VM"
  sensitive   = true
}

variable "vm_ssh_key_path" {
  type        = string
  description = "Path for the SSH public key on the VM"
}

variable "vm_ssh_key_data" {
  type        = string
  description = "SSH public key data"
  sensitive   = true
}

variable "vm_boot_diagnostics_enabled" {
  type        = bool
  description = "Whether boot diagnostics is enabled"
}

variable "vm_boot_diagnostics_storage_uri" {
  type        = string
  description = "Storage account blob endpoint for boot diagnostics"
  default     = null
}