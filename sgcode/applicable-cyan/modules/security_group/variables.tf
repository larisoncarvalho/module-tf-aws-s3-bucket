variable "vpc_id" {
  type        = string
  description = "VPC ID for security groups"
}

variable "security_groups" {
  type = map(object({
    name        = string
    description = string
    tags        = map(string)
  }))
  description = "Map of security groups to create"
  default     = {}
}

variable "ingress_rules" {
  type = map(object({
    security_group_key           = string
    from_port                    = number
    to_port                      = number
    ip_protocol                  = string
    cidr_ipv4                    = string
    referenced_security_group_id = string
    description                  = string
  }))
  description = "Map of ingress rules"
  default     = {}
}

variable "egress_rules" {
  type = map(object({
    security_group_key = string
    from_port          = number
    to_port            = number
    ip_protocol        = string
    cidr_ipv4          = string
    description        = string
  }))
  description = "Map of egress rules"
  default     = {}
}