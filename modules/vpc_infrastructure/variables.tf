variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for VPC"
  type        = string
}

variable "public_subnet_1a_cidr" {
  description = "CIDR block for public subnet in AZ 1a"
  type        = string
}

variable "public_subnet_1b_cidr" {
  description = "CIDR block for public subnet in AZ 1b"
  type        = string
}

variable "private_subnet_1a_cidr" {
  description = "CIDR block for private subnet in AZ 1a"
  type        = string
}

variable "private_subnet_1b_cidr" {
  description = "CIDR block for private subnet in AZ 1b"
  type        = string
}

variable "availability_zone_a" {
  description = "First availability zone"
  type        = string
}

variable "availability_zone_b" {
  description = "Second availability zone"
  type        = string
}