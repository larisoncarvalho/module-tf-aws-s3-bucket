variable "vpc_id" {
  type        = string
  description = "VPC ID where subnet will be created"
}

variable "cidr_block" {
  type        = string
  description = "IPv4 CIDR block for the subnet"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for subnet placement"
}

variable "assign_ipv6_address_on_creation" {
  type        = bool
  description = "Auto-assign IPv6 addresses to instances"
}

variable "ipv6_cidr_block" {
  type        = string
  description = "IPv6 CIDR block for the subnet"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Auto-assign public IPv4 addresses to instances"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}