variable "region" {
  description = "Azure region for the provider"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources exist"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "vm_zones" {
  description = "Availability zones for the VM"
  type        = list(string)
}

variable "computer_name" {
  description = "Computer name of the VM"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "disable_password_authentication" {
  description = "Whether password authentication is disabled"
  type        = bool
}

variable "ssh_key_path" {
  description = "Path for the SSH authorized keys file"
  type        = string
}

variable "ssh_key_data" {
  description = "Public SSH key data"
  type        = string
  sensitive   = true
}

variable "boot_diagnostics_enabled" {
  description = "Whether boot diagnostics is enabled"
  type        = bool
}

variable "boot_diagnostics_storage_uri" {
  description = "Storage URI for boot diagnostics"
  type        = string
}

variable "os_disk_name" {
  description = "Name of the OS disk"
  type        = string
}

variable "os_disk_create_option" {
  description = "Create option for the OS disk"
  type        = string
}

variable "os_disk_caching" {
  description = "Caching setting for the OS disk"
  type        = string
}

variable "vm_os_type" {
  description = "OS type of the VM disk"
  type        = string
}

variable "os_disk_managed_disk_type" {
  description = "Managed disk type for the OS disk"
  type        = string
}

variable "image_publisher" {
  description = "Publisher of the VM image"
  type        = string
}

variable "image_offer" {
  description = "Offer of the VM image"
  type        = string
}

variable "image_sku" {
  description = "SKU of the VM image"
  type        = string
}

variable "image_version" {
  description = "Version of the VM image"
  type        = string
}

variable "managed_disk_name" {
  description = "Name of the managed disk"
  type        = string
}

variable "managed_disk_storage_account_type" {
  description = "Storage account type for the managed disk"
  type        = string
}

variable "managed_disk_create_option" {
  description = "Create option for the managed disk"
  type        = string
}

variable "managed_disk_size_gb" {
  description = "Size of the managed disk in GB"
  type        = number
}

variable "managed_disk_os_type" {
  description = "OS type of the managed disk"
  type        = string
}

variable "managed_disk_hyper_v_generation" {
  description = "Hyper-V generation of the managed disk"
  type        = string
}

variable "managed_disk_trusted_launch_enabled" {
  description = "Whether trusted launch is enabled for the managed disk"
  type        = bool
}

variable "managed_disk_zone" {
  description = "Availability zone for the managed disk"
  type        = string
}

variable "managed_disk_image_reference_id" {
  description = "ID of the image used to create the managed disk"
  type        = string
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "nsg_security_rules" {
  description = "List of security rules for the NSG"
  type = list(object({
    name                       = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    access                     = string
    priority                   = number
    direction                  = string
  }))
  default = []
}

variable "public_ip_name" {
  description = "Name of the public IP address"
  type        = string
}

variable "public_ip_allocation_method" {
  description = "Allocation method for the public IP"
  type        = string
}

variable "public_ip_sku" {
  description = "SKU of the public IP"
  type        = string
}

variable "public_ip_version" {
  description = "IP version of the public IP"
  type        = string
}

variable "public_ip_zones" {
  description = "Availability zones for the public IP"
  type        = list(string)
}

variable "nic_name" {
  description = "Name of the network interface"
  type        = string
}

variable "nic_accelerated_networking_enabled" {
  description = "Whether accelerated networking is enabled on the NIC"
  type        = bool
}

variable "nic_ip_forwarding_enabled" {
  description = "Whether IP forwarding is enabled on the NIC"
  type        = bool
}

variable "nic_ip_config_name" {
  description = "Name of the IP configuration on the NIC"
  type        = string
}

variable "nic_subnet_id" {
  description = "ID of the subnet for the NIC"
  type        = string
}

variable "nic_private_ip_address_allocation" {
  description = "Private IP address allocation method for the NIC"
  type        = string
}

variable "nic_private_ip_address_version" {
  description = "Private IP address version for the NIC"
  type        = string
}

variable "nic_ip_config_primary" {
  description = "Whether the IP configuration is primary"
  type        = bool
}