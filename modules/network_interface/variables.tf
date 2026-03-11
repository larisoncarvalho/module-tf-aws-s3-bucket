variable "subnet_id" {
  description = "Subnet identifier"
  type        = string
}

variable "private_ips" {
  description = "Private IP addresses"
  type        = list(string)
}

variable "security_groups" {
  description = "Security group IDs"
  type        = list(string)
}

variable "source_dest_check" {
  description = "Source/destination check"
  type        = bool
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}