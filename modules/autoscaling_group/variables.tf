variable "name" {
  description = "Name of the auto scaling group"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones for the auto scaling group"
  type        = list(string)
}

variable "default_cooldown" {
  description = "Default cooldown period in seconds"
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type        = number
}

variable "health_check_grace_period" {
  description = "Health check grace period in seconds"
  type        = number
}

variable "health_check_type" {
  description = "Type of health check (EC2 or ELB)"
  type        = string
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
}

variable "new_instances_protected_from_scale_in" {
  description = "Whether new instances are protected from scale in"
  type        = bool
}

variable "service_linked_role_arn" {
  description = "ARN of the service linked role for auto scaling"
  type        = string
}

variable "termination_policies" {
  description = "List of termination policies"
  type        = list(string)
}

variable "vpc_zone_identifier" {
  description = "Subnet ID for the auto scaling group"
  type        = string
}

variable "launch_template_id" {
  description = "ID of the launch template"
  type        = string
}

variable "launch_template_version" {
  description = "Version of the launch template to use"
  type        = string
}