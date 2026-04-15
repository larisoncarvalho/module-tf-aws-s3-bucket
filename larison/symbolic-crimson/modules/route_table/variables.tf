variable "vpc_id" {
  type        = string
  description = "The VPC ID for the route table"
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID to associate with the route table"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the route table"
}