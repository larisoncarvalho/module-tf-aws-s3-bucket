variable "region" {
  type        = string
  description = "AWS region for resource deployment"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for instance network interface"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs to attach to instance"
}