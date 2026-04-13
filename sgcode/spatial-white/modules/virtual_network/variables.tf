variable "name" {
  type        = string
  description = "The name of the virtual network"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network"
}

variable "location" {
  type        = string
  description = "The Azure region where the virtual network will be created"
}

variable "address_prefixes" {
  type        = list(string)
  description = "The address space that is used by the virtual network"
}

variable "enable_ddos_protection" {
  type        = bool
  description = "Whether DDoS protection plan is enabled on the virtual network"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the virtual network"
}