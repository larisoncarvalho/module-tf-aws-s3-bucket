variable "region" {
  description = "AWS region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the Auto Scaling Group"
  type        = string
}

variable "launch_template_id" {
  description = "Launch template ID for the Auto Scaling Group"
  type        = string
}