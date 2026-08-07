# VPC
variable "vpc_cidr_block" {
  type = string
}

variable "vpc_instance_tenancy" {
  type    = string
  default = "default"
}

variable "vpc_enable_dns_support" {
  type    = bool
  default = true
}

variable "vpc_enable_dns_hostnames" {
  type    = bool
  default = false
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
}

# Internet Gateway
variable "igw_tags" {
  type    = map(string)
  default = {}
}

# Subnets
variable "subnets" {
  type = map(object({
    cidr_block                      = string
    availability_zone               = string
    map_public_ip_on_launch         = optional(bool, false)
    assign_ipv6_address_on_creation = optional(bool, false)
    tags                            = optional(map(string), {})
  }))
  default = {}
}

# Security Groups
variable "security_groups" {
  type = map(object({
    name        = string
    description = string
    ingress = optional(list(object({
      from_port        = number
      to_port          = number
      protocol         = string
      cidr_blocks      = optional(list(string), [])
      ipv6_cidr_blocks = optional(list(string), [])
      security_groups  = optional(list(string), [])
      self             = optional(bool, false)
      description      = optional(string, "")
    })), [])
    egress = optional(list(object({
      from_port        = number
      to_port          = number
      protocol         = string
      cidr_blocks      = optional(list(string), [])
      ipv6_cidr_blocks = optional(list(string), [])
      security_groups  = optional(list(string), [])
      self             = optional(bool, false)
      description      = optional(string, "")
    })), [])
    tags = optional(map(string), {})
  }))
  default = {}
}

# Route Table
variable "route_table_routes" {
  type = list(object({
    cidr_block     = optional(string, "")
    gateway_id     = optional(string, "")
    nat_gateway_id = optional(string, "")
  }))
  default = []
}

variable "route_table_tags" {
  type    = map(string)
  default = {}
}

# Network ACL
variable "network_acl_default_network_acl_id" {
  type = string
}

variable "network_acl_subnet_ids" {
  type    = list(string)
  default = []
}

variable "network_acl_ingress" {
  type = list(object({
    rule_no    = number
    action     = string
    protocol   = string
    cidr_block = optional(string, "")
    from_port  = optional(number, 0)
    to_port    = optional(number, 0)
  }))
  default = []
}

variable "network_acl_egress" {
  type = list(object({
    rule_no    = number
    action     = string
    protocol   = string
    cidr_block = optional(string, "")
    from_port  = optional(number, 0)
    to_port    = optional(number, 0)
  }))
  default = []
}

variable "network_acl_tags" {
  type    = map(string)
  default = {}
}

# Athena Workgroup
variable "athena_workgroup_name" {
  type = string
}

variable "athena_workgroup_state" {
  type    = string
  default = "ENABLED"
}

variable "athena_workgroup_enforce_workgroup_configuration" {
  type    = bool
  default = true
}

variable "athena_workgroup_publish_cloudwatch_metrics_enabled" {
  type    = bool
  default = true
}

variable "athena_workgroup_requester_pays_enabled" {
  type    = bool
  default = false
}

variable "athena_workgroup_selected_engine_version" {
  type    = string
  default = "AUTO"
}

variable "athena_workgroup_tags" {
  type    = map(string)
  default = {}
}

# CloudFormation Stack
variable "cloudformation_stack_name" {
  type = string
}

variable "cloudformation_stack_disable_rollback" {
  type    = bool
  default = false
}

variable "cloudformation_stack_tags" {
  type    = map(string)
  default = {}
}
