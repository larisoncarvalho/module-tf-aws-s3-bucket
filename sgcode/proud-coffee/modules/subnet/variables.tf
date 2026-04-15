variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the subnet"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Whether to auto-assign public IPs"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}