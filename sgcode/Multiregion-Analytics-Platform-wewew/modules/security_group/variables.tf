variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "vpc_id" {
  type = string
}

variable "ingress" {
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

variable "egress" {
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

variable "tags" {
  type    = map(string)
  default = {}
}
