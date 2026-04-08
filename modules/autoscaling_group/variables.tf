variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = number
}

variable "default_cooldown" {
  description = "Default cooldown period in seconds"
  type        = number
}

variable "health_check_grace_period" {
  description = "Health check grace period in seconds"
  type        = number
}

variable "health_check_type" {
  description = "Type of health check"
  type        = string
}

variable "vpc_zone_identifier" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "launch_template_id" {
  description = "ID of the launch template"
  type        = string
}

variable "launch_template_version" {
  description = "Version of the launch template"
  type        = string
}

variable "enabled_metrics" {
  description = "List of enabled CloudWatch metrics"
  type        = list(string)
}

variable "termination_policies" {
  description = "List of termination policies"
  type        = list(string)
}

variable "service_linked_role_arn" {
  description = "ARN of the service-linked role"
  type        = string
}

variable "new_instances_protected_from_scale_in" {
  description = "Whether new instances are protected from scale-in"
  type        = bool
}

variable "tags" {
  description = "Tags to apply to the Auto Scaling Group"
  type        = map(string)
}