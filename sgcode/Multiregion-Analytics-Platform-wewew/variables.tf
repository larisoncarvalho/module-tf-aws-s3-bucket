variable "athena_workgroup_name" {
  type    = string
  default = "primary"
}

variable "athena_workgroup_description" {
  type    = string
  default = ""
}

variable "athena_workgroup_enforce_workgroup_configuration" {
  type    = bool
  default = false
}

variable "athena_workgroup_publish_cloudwatch_metrics_enabled" {
  type    = bool
  default = true
}

variable "athena_workgroup_requester_pays_enabled" {
  type    = bool
  default = false
}

variable "athena_workgroup_state" {
  type    = string
  default = "ENABLED"
}

# CloudFormation Stack
variable "cloudformation_stack_name" {
  type    = string
  default = "stulyze-app"
}

variable "cloudformation_stack_disable_rollback" {
  type    = bool
  default = false
}

# IAM policies
variable "iam_policies" {
  type = map(object({
    name        = string
    path        = optional(string, "/")
    description = optional(string, null)
    policy      = string
  }))
  default = {}
}

# IAM roles
variable "iam_roles" {
  type = map(object({
    name                 = string
    path                 = optional(string, "/")
    description          = optional(string, null)
    assume_role_policy   = string
    max_session_duration = optional(number, 3600)
  }))
  default = {}
}

# Internet Gateway
variable "internet_gateway_vpc_id" {
  type    = string
  default = ""
}

# Default Subnets
variable "default_subnets" {
  type = map(object({
    availability_zone       = string
    map_public_ip_on_launch = optional(bool, true)
    tags                    = optional(map(string), {})
  }))
  default = {}
}

# Security groups (non-default)
variable "security_groups" {
  type = map(object({
    name        = string
    description = optional(string, "")
    vpc_id      = string
    ingress = optional(list(object({
      from_port       = optional(number, 0)
      to_port         = optional(number, 0)
      protocol        = string
      cidr_blocks     = optional(list(string), [])
      self            = optional(bool, false)
      security_groups = optional(list(string), [])
      description     = optional(string, null)
    })), [])
    egress = optional(list(object({
      from_port       = optional(number, 0)
      to_port         = optional(number, 0)
      protocol        = string
      cidr_blocks     = optional(list(string), [])
      self            = optional(bool, false)
      security_groups = optional(list(string), [])
      description     = optional(string, null)
    })), [])
    tags = optional(map(string), {})
  }))
  default = {}
}

# Default Security Group
variable "default_security_group_vpc_id" {
  type    = string
  default = ""
}

variable "default_security_group_ingress" {
  type = list(object({
    from_port       = optional(number, 0)
    to_port         = optional(number, 0)
    protocol        = string
    cidr_blocks     = optional(list(string), [])
    self            = optional(bool, false)
    security_groups = optional(list(string), [])
    description     = optional(string, null)
  }))
  default = []
}

variable "default_security_group_egress" {
  type = list(object({
    from_port       = optional(number, 0)
    to_port         = optional(number, 0)
    protocol        = string
    cidr_blocks     = optional(list(string), [])
    self            = optional(bool, false)
    security_groups = optional(list(string), [])
    description     = optional(string, null)
  }))
  default = []
}

# Route table
variable "route_table_vpc_id" {
  type    = string
  default = ""
}

variable "route_table_routes" {
  type = list(object({
    cidr_block                = optional(string, null)
    ipv6_cidr_block           = optional(string, null)
    gateway_id                = optional(string, null)
    nat_gateway_id            = optional(string, null)
    network_interface_id      = optional(string, null)
    transit_gateway_id        = optional(string, null)
    vpc_peering_connection_id = optional(string, null)
    egress_only_gateway_id    = optional(string, null)
  }))
  default = []
}

# Default Network ACL
variable "default_network_acl_id" {
  type    = string
  default = ""
}

variable "default_network_acl_subnet_ids" {
  type    = list(string)
  default = []
}

variable "default_network_acl_ingress" {
  type = list(object({
    rule_no    = number
    action     = string
    protocol   = string
    cidr_block = optional(string, null)
    from_port  = optional(number, 0)
    to_port    = optional(number, 0)
  }))
  default = []
}

variable "default_network_acl_egress" {
  type = list(object({
    rule_no    = number
    action     = string
    protocol   = string
    cidr_block = optional(string, null)
    from_port  = optional(number, 0)
    to_port    = optional(number, 0)
  }))
  default = []
}

# Keyspaces - ap-southeast-1
variable "keyspaces_ap_southeast_1" {
  type = map(object({
    name                 = string
    replication_strategy = optional(string, "SINGLE_REGION")
    tags                 = optional(map(string), {})
  }))
  default = {}
}

# Keyspaces - eu-central-1
variable "keyspaces_eu_central_1" {
  type = map(object({
    name                 = string
    replication_strategy = optional(string, "SINGLE_REGION")
    tags                 = optional(map(string), {})
  }))
  default = {}
}

# Keyspaces - us-west-1
variable "keyspaces_us_west_1" {
  type = map(object({
    name                 = string
    replication_strategy = optional(string, "SINGLE_REGION")
    tags                 = optional(map(string), {})
  }))
  default = {}
}
