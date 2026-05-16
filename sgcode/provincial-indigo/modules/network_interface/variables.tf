variable "subnet_id" {
  type        = string
  description = "Subnet ID for the network interface"
}

variable "private_ips" {
  type        = list(string)
  description = "Private IP addresses for the network interface"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs for the network interface"
}

variable "source_dest_check" {
  type        = bool
  description = "Enable source/destination checking"
}

variable "instance_id" {
  type        = string
  description = "Instance ID to attach the network interface to"
}

variable "device_index" {
  type        = number
  description = "Device index for the network interface attachment"
}