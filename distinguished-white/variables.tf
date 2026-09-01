variable "region" {
  type        = string
  description = "AWS region for resource deployment"
  default     = "eu-central-1"
}

variable "subnet_id" {
  type        = string
  description = "VPC subnet ID for instance network interface"
  default     = ""
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs to attach to instance"
  default     = []
}

variable "iam_instance_profile_name" {
  type        = string
  description = "IAM instance profile name"
  default     = ""
}