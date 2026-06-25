variable "subscription_id" {
  type    = string
  default = "a97621d8-9158-4681-81b6-38b1222afba4"
}

variable "public_ips" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = string
    ip_version          = optional(string, "IPv4")
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "network_interfaces" {
  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    enable_accelerated_networking = optional(bool, false)
    ip_forwarding_enabled         = optional(bool, false)
    tags                          = optional(map(string), {})
    ip_configurations = list(object({
      name                          = string
      private_ip_address_allocation = string
      private_ip_address            = optional(string)
      public_ip_address_id          = optional(string)
      subnet_id                     = optional(string)
      primary                       = optional(bool)
    }))
  }))
  default = {}
}

variable "managed_disks" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = optional(number)
    os_type              = optional(string)
    hyper_v_generation   = optional(string)
    image_reference_id   = optional(string)
    tags                 = optional(map(string), {})
  }))
  default = {}
}

variable "virtual_machines" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    vm_size                      = string
    admin_username               = string
    admin_password               = optional(string)
    network_interface_keys       = list(string)
    os_disk_name                 = string
    os_disk_caching              = string
    os_disk_create_option        = string
    os_disk_managed_disk_type    = optional(string)
    image_publisher              = string
    image_offer                  = string
    image_sku                    = string
    image_version                = string
    identity_type                = optional(string)
    provision_vm_agent           = optional(bool, true)
    enable_automatic_upgrades    = optional(bool, false)
    boot_diagnostics_enabled     = optional(bool, false)
    boot_diagnostics_storage_uri = optional(string)
    ultra_ssd_enabled            = optional(bool, false)
    tags                         = optional(map(string), {})
  }))
  default = {}
}
