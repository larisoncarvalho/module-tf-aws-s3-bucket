variable "name" {
  description = "Name of the auto scaling group"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "default_cooldown" {
  description = "Default cooldown period"
  type        = number
}

variable "desired_capacity" {
  description = "Desired capacity"
  type        = number
}

variable "health_check_grace_period" {
  description = "Health check grace period"
  type        = number
}

variable "health_check_type" {
  description = "Health check type"
  type        = string
}

variable "max_size" {
  description = "Maximum size"
  type        = number
}

variable "min_size" {
  description = "Minimum size"
  type        = number
}

variable "new_instances_protected_from_scale_in" {
  description = "Whether new instances are protected from scale in"
  type        = bool
}

variable "service_linked_role_arn" {
  description = "Service linked role ARN"
  type        = string
}

variable "termination_policies" {
  description = "Termination policies"
  type        = list(string)
}

variable "vpc_zone_identifier" {
  description = "VPC zone identifier"
  type        = string
}

variable "launch_template_id" {
  description = "Launch template ID"
  type        = string
}

variable "launch_template_version" {
  description = "Launch template version"
  type        = string
}