variable "subnet_id" {
  type        = string
  description = "Subnet ID for the network interface"
}

variable "private_ips" {
  type        = list(string)
  description = "Private IP addresses assigned to the network interface"
}

variable "security_groups" {
  type        = list(string)
  description = "Security group IDs assigned to the network interface"
}

variable "source_dest_check" {
  type        = bool
  description = "Whether source/destination check is enabled"
}