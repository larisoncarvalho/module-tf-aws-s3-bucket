variable "region" {
  type        = string
  description = "The Azure region where resources will be deployed"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
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
  description = "A mapping of tags to assign to resources"
}