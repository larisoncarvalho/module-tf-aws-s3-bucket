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