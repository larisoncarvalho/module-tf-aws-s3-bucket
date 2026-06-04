# Variables for the network_interface module.

variable "subnet_id" {
  description = "Subnet ID in which the ENI resides."
  type        = string
}

variable "private_ips" {
  description = "List of private IP addresses assigned to the ENI."
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs attached to the ENI."
  type        = list(string)
}

variable "source_dest_check" {
  description = "Whether source/destination checking is enabled."
  type        = bool
  default     = true
}

variable "description" {
  description = "Description for the network interface."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to assign to the network interface."
  type        = map(string)
  default     = {}
}
