variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_groups" {
  description = "Security group IDs"
  type        = list(string)
  default     = []
}

variable "description" {
  description = "Interface description"
  type        = string
  default     = ""
}

variable "private_ips" {
  description = "Private IP addresses"
  type        = list(string)
  default     = []
}

variable "source_dest_check" {
  description = "Source/dest check"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
