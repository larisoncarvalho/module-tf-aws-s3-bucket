variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the VM exists"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "zones" {
  description = "Availability zones for the VM"
  type        = list(string)
}

variable "network_interface_id" {
  description = "ID of the network interface to attach to the VM"
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

variable "os_type" {
  description = "OS type of the disk"
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
  sensitive   = true
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