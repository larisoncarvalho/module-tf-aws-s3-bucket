variable "vpc_id" {
  type        = string
  description = "The VPC ID to create the subnet in"
}

variable "cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the subnet"
}

variable "availability_zone" {
  type        = string
  description = "The AZ for the subnet"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the subnet"
}