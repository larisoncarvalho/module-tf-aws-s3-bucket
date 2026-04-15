variable "name" {
  description = "Public IP name"
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

variable "public_ip_allocation_method" {
  description = "Public IP allocation method"
  type        = string
}

variable "public_ip_address_version" {
  description = "IP version"
  type        = string
}

variable "sku_name" {
  description = "SKU name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the public IP"
  type        = map(string)
}