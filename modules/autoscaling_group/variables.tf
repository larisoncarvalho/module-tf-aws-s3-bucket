variable "name" {
  type        = string
  description = "Name of the Auto Scaling Group"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones for the Auto Scaling Group"
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

variable "launch_template_id" {
  type        = string
  description = "ID of the launch template"
}

variable "launch_template_version" {
  type        = string
  description = "Version of the launch template"
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
  type        = list(string)
  description = "List of subnet IDs"
}

variable "termination_policies" {
  type        = list(string)
  description = "Termination policies for the Auto Scaling Group"
}