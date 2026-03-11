variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "instance_tenancy" {
  description = "VPC instance tenancy"
  type        = string
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Assign generated IPv6 CIDR block"
  type        = bool
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}