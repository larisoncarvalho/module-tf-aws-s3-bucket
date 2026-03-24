variable "vpc_id" {
  type        = string
  description = "VPC ID where subnet will be created"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the subnet"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the subnet"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Whether to auto-assign public IPs to instances launched in this subnet"
}

variable "assign_ipv6_address_on_creation" {
  type        = bool
  description = "Whether to assign IPv6 addresses on instance creation"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}