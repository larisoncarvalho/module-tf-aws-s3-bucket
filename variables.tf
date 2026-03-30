variable "resource_groups" {
  description = "Map of resource groups to create"
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "virtual_network_azurenetworknet" {
  description = "Configuration for azurenetworknet virtual network"
  type = object({
    name          = string
    location      = string
    address_space = list(string)
    tags          = map(string)
  })
}