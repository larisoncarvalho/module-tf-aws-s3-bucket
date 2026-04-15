variable "vpc_id" {
  type        = string
  description = "VPC ID where the subnet will be created"
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
  description = "Whether to map public IP on launch"
}

variable "assign_ipv6_address_on_creation" {
  type        = bool
  description = "Whether to assign IPv6 address on creation"
}

variable "enable_dns64" {
  type        = bool
  description = "Whether to enable DNS64"
}

variable "enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "Whether to enable resource name DNS A record on launch"
}

variable "enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  description = "Whether to enable resource name DNS AAAA record on launch"
}

variable "ipv6_native" {
  type        = bool
  description = "Whether the subnet is IPv6 native"
}

variable "private_dns_hostname_type_on_launch" {
  type        = string
  description = "Private DNS hostname type on launch"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the subnet"
}