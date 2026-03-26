variable "vpc_id" {
  type        = string
  description = "VPC ID for the route table"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the route table"
  default     = {}
}