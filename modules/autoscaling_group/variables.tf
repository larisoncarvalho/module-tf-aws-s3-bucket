variable "name" {
  type        = string
  description = "Auto Scaling Group name"
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

variable "default_cooldown" {
  type        = number
  description = "Default cooldown period in seconds"
}

variable "health_check_grace_period" {
  type        = number
  description = "Health check grace period in seconds"
}

variable "health_check_type" {
  type        = string
  description = "Health check type (EC2 or ELB)"
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "List of subnet IDs"
}

variable "termination_policies" {
  type        = list(string)
  description = "Termination policies for the Auto Scaling Group"
}

variable "launch_template_id" {
  type        = string
  description = "Launch template ID"
}

variable "launch_template_version" {
  type        = string
  description = "Launch template version"
}