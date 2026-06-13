variable "vpc_id" {
  type        = string
  description = "VPC identifier"
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
  description = "Whether instances launched in this subnet receive a public IP"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}