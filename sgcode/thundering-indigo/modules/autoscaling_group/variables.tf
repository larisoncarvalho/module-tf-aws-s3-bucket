variable "name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of EC2 instances in the Auto Scaling Group"
  type        = number
}

variable "default_cooldown" {
  description = "Amount of time in seconds after a scaling activity completes before another can start"
  type        = number
}

variable "health_check_grace_period" {
  description = "Time in seconds after instance comes into service before checking health"
  type        = number
}

variable "health_check_type" {
  description = "Health check type, either EC2 or ELB"
  type        = string
}

variable "protect_from_scale_in" {
  description = "Whether newly launched instances are protected from termination on scale in"
  type        = bool
}

variable "service_linked_role_arn" {
  description = "ARN of the service-linked role used by the ASG"
  type        = string
}

variable "termination_policies" {
  description = "List of policies to determine how instances are terminated"
  type        = list(string)
}

variable "vpc_zone_identifier" {
  description = "List of subnet IDs to launch resources in"
  type        = list(string)
}

variable "launch_template_id" {
  description = "ID of the launch template to use"
  type        = string
}

variable "launch_template_version" {
  description = "Version of the launch template to use"
  type        = string
}