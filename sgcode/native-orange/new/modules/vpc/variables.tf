variable "cidr_block" {
  type        = string
  description = "Primary IPv4 CIDR block for the VPC"
}

variable "instance_tenancy" {
  type        = string
  description = "Tenancy option for instances launched into the VPC"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}