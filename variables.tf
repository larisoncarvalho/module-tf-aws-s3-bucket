variable "athena_workgroups" {
  type = map(object({
    name                               = string
    state                              = optional(string, "ENABLED")
    enforce_workgroup_configuration    = optional(bool, false)
    publish_cloudwatch_metrics_enabled = optional(bool, true)
    requester_pays_enabled             = optional(bool, false)
    selected_engine_version            = optional(string, "AUTO")
  }))
  default = {}
}

variable "cloudformation_stacks" {
  type = map(object({
    name             = string
    disable_rollback = optional(bool, false)
    tags             = optional(map(string), {})
  }))
  default = {}
}

variable "iam_policies" {
  type = map(object({
    name        = string
    path        = optional(string, "/")
    description = optional(string, null)
    policy_file = string
    tags        = optional(map(string), {})
  }))
  default = {}
}

variable "iam_roles" {
  type = map(object({
    name                 = string
    path                 = optional(string, "/")
    description          = optional(string, null)
    max_session_duration = optional(number, 3600)
    assume_role_policy   = string
    tags                 = optional(map(string), {})
  }))
  default = {}
}

variable "vpc" {
  type = object({
    cidr_block       = string
    instance_tenancy = optional(string, "default")
    tags             = optional(map(string), {})
  })
}

variable "subnets" {
  type = map(object({
    cidr_block                      = string
    availability_zone               = string
    vpc_id                          = string
    map_public_ip_on_launch         = optional(bool, false)
    assign_ipv6_address_on_creation = optional(bool, false)
    tags                            = optional(map(string), {})
  }))
  default = {}
}

variable "security_groups" {
  type = map(object({
    name        = optional(string, null)
    description = string
    vpc_id      = string
    tags        = optional(map(string), {})
  }))
  default = {}
}

variable "internet_gateway" {
  type = object({
    vpc_id = string
    tags   = optional(map(string), {})
  })
}

variable "route_table" {
  type = object({
    vpc_id = string
    routes = optional(list(object({
      cidr_block = optional(string, "")
      gateway_id = optional(string, "")
    })), [])
    tags = optional(map(string), {})
  })
}

variable "network_acl" {
  type = object({
    default_network_acl_id = string
    ingress_rules = optional(list(object({
      rule_no    = number
      protocol   = string
      action     = string
      cidr_block = optional(string, "")
      from_port  = optional(number, 0)
      to_port    = optional(number, 0)
    })), [])
    egress_rules = optional(list(object({
      rule_no    = number
      protocol   = string
      action     = string
      cidr_block = optional(string, "")
      from_port  = optional(number, 0)
      to_port    = optional(number, 0)
    })), [])
    tags = optional(map(string), {})
  })
}
