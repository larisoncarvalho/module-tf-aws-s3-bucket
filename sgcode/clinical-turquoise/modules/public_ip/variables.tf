variable "public_ip_name" {
  description = "Name of the public IP address"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the public IP exists"
  type        = string
}

variable "allocation_method" {
  description = "Allocation method for the public IP"
  type        = string
}

variable "sku" {
  description = "SKU of the public IP"
  type        = string
}

variable "ip_version" {
  description = "IP version of the public IP"
  type        = string
}

variable "zones" {
  description = "Availability zones for the public IP"
  type        = list(string)
}