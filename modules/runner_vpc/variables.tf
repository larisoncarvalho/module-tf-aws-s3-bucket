variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "tags" {
  description = "Tags for VPC"
  type        = map(string)
  default     = {}
}