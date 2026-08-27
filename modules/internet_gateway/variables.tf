variable "vpc_id" {
  type        = string
  description = "The VPC ID to attach the Internet Gateway to."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the Internet Gateway."
}
