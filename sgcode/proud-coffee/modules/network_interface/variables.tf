variable "subnet_id" {
  type        = string
  description = "Subnet ID for the network interface"
}

variable "private_ips" {
  type        = list(string)
  description = "List of private IP addresses"
}

variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "source_dest_check" {
  type        = bool
  description = "Whether source/destination checking is enabled"
}