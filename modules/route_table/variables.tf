variable "vpc_id" {
  description = "VPC ID for the route table"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the route table"
  type        = map(string)
}

variable "routes" {
  description = "Routes to create in the route table (excluding local route)"
  type = map(object({
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