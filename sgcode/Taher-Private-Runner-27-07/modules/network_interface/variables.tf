variable "subnet_id" {
  type        = string
  description = "Subnet ID to create the ENI in"
}

variable "private_ips" {
  type        = list(string)
  description = "List of private IPs to assign to the ENI"
  default     = []
}

variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs"
  default     = []
}

variable "description" {
  type        = string
  description = "A description for the network interface"
  default     = ""
}

variable "source_dest_check" {
  type        = bool
  description = "Whether to enable source/destination checking"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the network interface"
  default     = {}
}
