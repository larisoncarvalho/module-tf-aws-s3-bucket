variable "vpc_id" {
  description = "VPC ID for the route table"
  type        = string
}

variable "routes" {
  description = "Routes to create in the route table"
  type = map(object({
    destination_cidr_block = string
    gateway_id             = string
  }))
  default = {}
}

variable "subnet_associations" {
  description = "Subnet associations for the route table"
  type = map(object({
    subnet_id = string
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to the route table"
  type        = map(string)
}