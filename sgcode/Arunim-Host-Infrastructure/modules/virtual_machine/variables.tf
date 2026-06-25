variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  default   = null
  sensitive = true
}

variable "network_interface_ids" {
  type = list(string)
}

variable "os_disk_name" {
  type = string
}

variable "os_disk_caching" {
  type    = string
  default = "ReadWrite"
}

variable "os_disk_create_option" {
  type    = string
  default = "FromImage"
}

variable "os_disk_managed_disk_type" {
  type    = string
  default = null
}

variable "image_publisher" {
  type = string
}

variable "image_offer" {
  type = string
}

variable "image_sku" {
  type = string
}

variable "image_version" {
  type    = string
  default = "latest"
}

variable "identity_type" {
  type    = string
  default = null
}

variable "provision_vm_agent" {
  type    = bool
  default = true
}

variable "enable_automatic_upgrades" {
  type    = bool
  default = false
}

variable "boot_diagnostics_enabled" {
  type    = bool
  default = false
}

variable "boot_diagnostics_storage_uri" {
  type    = string
  default = null
}

variable "ultra_ssd_enabled" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
