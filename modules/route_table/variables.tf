variable "vpc_id" {
  description = "VPC ID for the route table"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}

variable "routes" {
  description = "Routes to create (excluding local routes)"
  type = map(object({
    destination_cidr_block     = optional(string)
    destination_prefix_list_id = optional(string)
    gateway_id                 = optional(string)
  }))
  default = {}
}

variable "associations" {
  description = "Subnet associations for the route table"
  type = map(object({
    subnet_id = string
  }))
  default = {}
}