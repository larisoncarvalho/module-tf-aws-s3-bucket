variable "nic_name" {
  description = "Name of the network interface"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the NIC exists"
  type        = string
}

variable "accelerated_networking_enabled" {
  description = "Whether accelerated networking is enabled"
  type        = bool
}

variable "ip_forwarding_enabled" {
  description = "Whether IP forwarding is enabled"
  type        = bool
}

variable "ip_config_name" {
  description = "Name of the IP configuration"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet for the NIC"
  type        = string
}

variable "private_ip_address_allocation" {
  description = "Private IP address allocation method"
  type        = string
}

variable "private_ip_address_version" {
  description = "Private IP address version"
  type        = string
}

variable "public_ip_address_id" {
  description = "ID of the public IP address to associate with the NIC"
  type        = string
}

variable "ip_config_primary" {
  description = "Whether this is the primary IP configuration"
  type        = bool
}