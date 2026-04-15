variable "vpc_id" {
  type        = string
  description = "VPC ID for the route table"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}

variable "routes" {
  type = map(object({
    destination_cidr_block = string
    gateway_id             = string
  }))
  description = "Non-local routes to create"
  default     = {}
}