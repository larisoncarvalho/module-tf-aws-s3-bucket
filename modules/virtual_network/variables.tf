variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "location" {
  description = "Azure region for the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the virtual network"
  type        = string
}

variable "address_prefixes" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the virtual network"
  type        = map(string)
}

variable "subnets" {
  description = "Subnets to create in the virtual network"
  type        = map(object({ address_prefixes = list(string) }))
  default     = {}
}