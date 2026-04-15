variable "region" {
  description = "Azure region"
  type        = string
}

variable "resource_groups" {
  description = "Map of resource groups to create"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
}

variable "virtual_network_azurenetworknet" {
  description = "Virtual network configuration"
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string), {})
  })
}