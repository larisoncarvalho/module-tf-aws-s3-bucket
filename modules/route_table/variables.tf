variable "vpc_id" {
  type        = string
  description = "The VPC ID for the route table"
}

variable "internet_gateway_id" {
  type        = string
  description = "The internet gateway ID for the default route"
}