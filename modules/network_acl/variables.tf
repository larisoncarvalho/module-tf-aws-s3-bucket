variable "vpc_id" {
  description = "VPC ID for the network ACL"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the network ACL"
  type        = list(string)
}

variable "acl_rules" {
  description = "Network ACL rules to create"
  type = map(object({
    rule_number      = number
    egress           = bool
    protocol         = string
    rule_action      = string
    cidr_block       = optional(string)
    ipv6_cidr_block  = optional(string)
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to the network ACL"
  type        = map(string)
}