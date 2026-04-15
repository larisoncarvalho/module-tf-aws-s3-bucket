variable "region" {
  type        = string
  description = "AWS region"
}

variable "launch_template_id" {
  type        = string
  description = "ID of the launch template"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the Auto Scaling Group"
}