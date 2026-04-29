variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the subnet"
}

variable "default_outbound_access_enabled" {
  type        = bool
  description = "Enable default outbound access"
}

variable "private_endpoint_network_policies_enabled" {
  type        = bool
  description = "Enable private endpoint network policies"
}

variable "private_link_service_network_policies_enabled" {
  type        = bool
  description = "Enable private link service network policies"
}