variable "name" {
  description = "Network interface name"
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

variable "enable_accelerated_networking" {
  description = "Enable accelerated networking"
  type        = bool
}

variable "enable_ip_forwarding" {
  description = "Enable IP forwarding"
  type        = bool
}

variable "network_security_group_id" {
  description = "Network security group ID to associate"
  type        = string
}

variable "ip_configurations" {
  description = "IP configurations for the network interface"
  type = list(object({
    name                         = string
    subnet_id                    = string
    private_ip_allocation_method = string
    private_ip_address_version   = string
    public_ip_address_id         = string
    primary                      = bool
  }))
}

variable "tags" {
  description = "Tags to apply to the network interface"
  type        = map(string)
}