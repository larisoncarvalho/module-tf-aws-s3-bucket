variable "region" {
  type        = string
  description = "AWS region"
}

variable "subnet_id" {
  type        = string
  description = "VPC subnet ID"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type"
}