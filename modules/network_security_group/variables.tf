variable "name" {
  description = "Network security group name"
  type        = string
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the network security group"
  type        = map(string)
}

variable "security_rules" {
  description = "Security rules to create"
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = optional(string)
    source_address_prefixes    = optional(list(string))
    destination_address_prefix = string
    description                = string
  }))
  default = {}
}