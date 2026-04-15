variable "vpc_id" {
  type        = string
  description = "VPC ID where the subnet will be created"
}

variable "cidr_block" {
  type        = string
  description = "IPv4 CIDR block for the subnet"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the subnet"
}

variable "assign_ipv6_address_on_creation" {
  type        = bool
  description = "Whether to assign IPv6 addresses on instance creation"
}

variable "ipv6_cidr_block" {
  type        = string
  description = "IPv6 CIDR block for the subnet"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Whether to map public IP on launch"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the subnet"
}