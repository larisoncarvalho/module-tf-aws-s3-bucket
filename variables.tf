variable "region" {
  description = "AWS region"
  type        = string
}

variable "do_not_delete_vpc" {
  description = "Configuration for the do_not_delete VPC"
  type = object({
    cidr_block           = string
    instance_tenancy     = string
    enable_dns_hostnames = optional(bool)
    enable_dns_support   = optional(bool)
    tags                 = map(string)
  })
}

variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    tags                    = map(string)
  }))
}

variable "do_not_delete_igw" {
  description = "Configuration for the do_not_delete internet gateway"
  type = object({
    tags = map(string)
  })
}

variable "do_not_delete_private_route_table" {
  description = "Configuration for the do_not_delete private route table"
  type = object({
    routes              = optional(any, {})
    subnet_associations = optional(any, {})
    tags                = map(string)
  })
}

variable "default_security_group" {
  description = "Configuration for the default security group"
  type = object({
    name        = string
    description = string
    tags        = map(string)
  })
}

variable "do_not_delete_default_nacl" {
  description = "Configuration for the do_not_delete default network ACL"
  type = object({
    subnet_ids = list(string)
    acl_rules  = optional(any, {})
    tags       = map(string)
  })
}