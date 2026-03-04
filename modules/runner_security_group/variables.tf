variable "name" {
  description = "Security group name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for security group"
  type        = string
}

variable "description" {
  description = "Security group description"
  type        = string
  default     = "Security group for GitHub Actions runner"
}