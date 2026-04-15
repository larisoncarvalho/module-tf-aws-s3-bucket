variable "role_name" {
  description = "Name of IAM role"
  type        = string
}

variable "instance_profile_name" {
  description = "Name of IAM instance profile"
  type        = string
}

variable "role_path" {
  description = "Path for IAM role"
  type        = string
  default     = "/"
}