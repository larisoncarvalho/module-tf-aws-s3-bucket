variable "name" {
  description = "Security group name"
  type        = string
}

variable "description" {
  description = "Security group description"
  type        = string
}

variable "vpc_id" {
  description = "VPC identifier"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}

variable "rules" {
  description = "Security group rules to create"
  type = map(object({
    type                     = string
    protocol                 = string
    from_port                = optional(number)
    to_port                  = optional(number)
    cidr_blocks              = optional(list(string))
    ipv6_cidr_blocks         = optional(list(string))
    source_security_group_id = optional(string)
    self                     = optional(bool)
    description              = optional(string)
  }))
  default = {}
}