variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "enable_accelerated_networking" {
  type    = bool
  default = false
}

variable "ip_forwarding_enabled" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "ip_configurations" {
  type = list(object({
    name                          = string
    private_ip_address_allocation = string
    private_ip_address            = optional(string)
    public_ip_address_id          = optional(string)
    subnet_id                     = optional(string)
    primary                       = optional(bool)
  }))
  default = []
}
