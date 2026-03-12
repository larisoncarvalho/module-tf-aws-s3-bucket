variable "vpc_id" {
  description = "VPC ID to attach the internet gateway to"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the internet gateway"
  type        = map(string)
}