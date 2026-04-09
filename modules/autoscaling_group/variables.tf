variable "name" {
  type        = string
  description = "Name of the autoscaling group"
}

variable "default_cooldown" {
  type        = number
  description = "Default cooldown period in seconds"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of instances"
}

variable "health_check_grace_period" {
  type        = number
  description = "Health check grace period in seconds"
}

variable "health_check_type" {
  type        = string
  description = "Type of health check"
}

variable "max_size" {
  type        = number
  description = "Maximum number of instances"
}

variable "min_size" {
  type        = number
  description = "Minimum number of instances"
}

variable "vpc_zone_identifier" {
  type        = string
  description = "Subnet ID for the autoscaling group"
}

variable "launch_template_id" {
  type        = string
  description = "Launch template ID"
}

variable "launch_template_version" {
  type        = string
  description = "Launch template version"
}

variable "enabled_metrics" {
  type        = list(string)
  description = "List of enabled CloudWatch metrics"
}

variable "termination_policies" {
  type        = list(string)
  description = "Termination policies for the autoscaling group"
}

variable "new_instances_protected_from_scale_in" {
  type        = bool
  description = "Whether new instances are protected from scale in"
}

variable "service_linked_role_arn" {
  type        = string
  description = "ARN of the service-linked role for autoscaling"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the autoscaling group"
}