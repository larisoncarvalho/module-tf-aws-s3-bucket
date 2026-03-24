variable "region" {
  type        = string
  description = "AWS region"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the instance"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs to attach"
}