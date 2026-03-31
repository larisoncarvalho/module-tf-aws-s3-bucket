variable "name" {
  description = "Virtual network name"
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

variable "address_prefixes" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the virtual network"
  type        = map(string)
}