variable "region" {
  type        = string
  description = "AWS region for resources"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where instance will be launched"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "iam_instance_profile_arn" {
  type        = string
  description = "IAM instance profile ARN"
}

variable "root_volume_type" {
  type        = string
  description = "Type of root volume"
}