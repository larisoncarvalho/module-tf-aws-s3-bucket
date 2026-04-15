variable "region" {
  type        = string
  description = "AWS region"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the autoscaling group"
}

variable "launch_template_id" {
  type        = string
  description = "Launch template ID"
}

variable "autoscaling_service_role_policy_arn" {
  type        = string
  description = "ARN of the autoscaling service role policy"
}