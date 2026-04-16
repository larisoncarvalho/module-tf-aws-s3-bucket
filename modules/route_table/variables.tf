variable "vpc_id" {
  type        = string
  description = "The VPC ID for the route table"
}

variable "internet_gateway_id" {
  type        = string
  description = "The Internet Gateway ID for the default route"
}