variable "vpc_id" {
  description = "VPC ID for subnet"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for subnet"
  type        = string
}

variable "tags" {
  description = "Tags for subnet"
  type        = map(string)
  default     = {}
}