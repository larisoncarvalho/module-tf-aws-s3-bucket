variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "private_ips" {
  type        = list(string)
  default     = []
  description = "Private IP addresses"
}

variable "security_groups" {
  type        = list(string)
  default     = []
  description = "Security group IDs"
}

variable "description" {
  type        = string
  default     = ""
  description = "Description"
}

variable "source_dest_check" {
  type        = bool
  default     = true
  description = "Source/dest check"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags"
}
