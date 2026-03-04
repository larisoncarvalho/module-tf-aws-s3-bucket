variable "role_name" {
  description = "Name of IAM role for EC2 instances"
  type        = string
}

variable "instance_profile_name" {
  description = "Name of IAM instance profile"
  type        = string
}

variable "role_path" {
  description = "Path for IAM resources"
  type        = string
  default     = "/"
}