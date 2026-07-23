variable "asg_name" {
  type        = string
  description = "Name of the autoscaling group"
}

variable "max_size" {
  type        = number
  description = "Maximum number of instances"
}

variable "min_size" {
  type        = number
  description = "Minimum number of instances"
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

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "List of subnet IDs"
}

variable "launch_template_id" {
  type        = string
  description = "ID of the launch template"
}

variable "launch_template_version" {
  type        = string
  description = "Version of the launch template"
}

variable "default_cooldown" {
  type        = number
  description = "Default cooldown period in seconds"
}

variable "termination_policies" {
  type        = list(string)
  description = "List of termination policies"
}

variable "protect_from_scale_in" {
  type        = bool
  description = "Whether instances are protected from scale-in"
}

variable "service_linked_role_arn" {
  type        = string
  description = "ARN of the service-linked role"
}