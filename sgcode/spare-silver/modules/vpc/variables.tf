variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "instance_tenancy" {
  type        = string
  description = "Instance tenancy option for instances launched into the VPC"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}