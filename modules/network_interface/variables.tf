variable "subnet_id" {
  type        = string
  description = "Subnet ID for the network interface"
}

variable "private_ips" {
  type        = list(string)
  description = "Private IP addresses"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs"
}

variable "source_dest_check" {
  type        = bool
  description = "Enable source/destination checking"
}

variable "instance_id" {
  type        = string
  description = "Instance ID to attach to"
}

variable "device_index" {
  type        = number
  description = "Network interface device index"
}