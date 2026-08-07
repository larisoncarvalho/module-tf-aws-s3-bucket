variable "vpc_id" {
  type = string
}

variable "routes" {
  type = list(object({
    cidr_block     = optional(string, "")
    gateway_id     = optional(string, "")
    nat_gateway_id = optional(string, "")
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
