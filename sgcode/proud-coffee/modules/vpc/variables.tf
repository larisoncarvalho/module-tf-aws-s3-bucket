variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "instance_tenancy" {
  type        = string
  description = "Instance tenancy"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Whether to enable DNS hostnames"
}

variable "enable_dns_support" {
  type        = bool
  description = "Whether to enable DNS support"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}