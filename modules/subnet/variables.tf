variable "vpc_id" {
  description = "VPC ID where the subnet will be created"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Whether instances launched in this subnet receive a public IP"
  type        = bool
}

variable "tags" {
  description = "Tags to apply to the subnet"
  type        = map(string)
}