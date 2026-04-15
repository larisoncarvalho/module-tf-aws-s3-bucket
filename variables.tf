variable "region" {
  description = "Azure region for resources"
  type        = string
}

variable "resource_groups" {
  description = "Map of resource groups to create"
  type = map(object({
    location = string
    tags     = map(string)
  }))
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    address_prefixes = optional(list(string), [])
  }))
}