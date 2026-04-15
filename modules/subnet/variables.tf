variable "vpc_id" {
  description = "VPC identifier"
  type        = string
}

variable "cidr_block" {
  description = "Subnet CIDR block"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch"
  type        = bool
}

variable "assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on creation"
  type        = bool
}

variable "ipv6_cidr_block" {
  description = "IPv6 CIDR block"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}