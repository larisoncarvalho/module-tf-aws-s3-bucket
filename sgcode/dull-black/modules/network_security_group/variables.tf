variable "name" {
  type        = string
  description = "Name of the network security group"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where the NSG exists"
}

variable "security_rule_name" {
  type        = string
  description = "Name of the security rule"
}

variable "security_rule_protocol" {
  type        = string
  description = "Protocol for the security rule"
}

variable "security_rule_source_port_range" {
  type        = string
  description = "Source port range for the security rule"
}

variable "security_rule_destination_port_range" {
  type        = string
  description = "Destination port range for the security rule"
}

variable "security_rule_source_address_prefix" {
  type        = string
  description = "Source address prefix for the security rule"
}

variable "security_rule_destination_address_prefix" {
  type        = string
  description = "Destination address prefix for the security rule"
}

variable "security_rule_access" {
  type        = string
  description = "Access setting for the security rule"
}

variable "security_rule_priority" {
  type        = number
  description = "Priority of the security rule"
}

variable "security_rule_direction" {
  type        = string
  description = "Direction of the security rule"
}