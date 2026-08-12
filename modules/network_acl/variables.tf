variable "default_network_acl_id" {
  type = string
}

variable "ingress_rules" {
  type = list(object({
    rule_no    = number
    protocol   = string
    action     = string
    cidr_block = optional(string, "")
    from_port  = optional(number, 0)
    to_port    = optional(number, 0)
  }))
  default = []
}

variable "egress_rules" {
  type = list(object({
    rule_no    = number
    protocol   = string
    action     = string
    cidr_block = optional(string, "")
    from_port  = optional(number, 0)
    to_port    = optional(number, 0)
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
