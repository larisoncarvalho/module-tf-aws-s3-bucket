variable "default_network_acl_id" {
  type        = string
  description = "Default network ACL ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs to associate with the network ACL"
  default     = []
}

variable "ingress_rules" {
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
  description = "Ingress rules for the network ACL"
  default     = []
}

variable "egress_rules" {
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
  description = "Egress rules for the network ACL"
  default     = []
}