variable "name" {
  type        = string
  description = "Name of the Auto Scaling group"
}

variable "max_size" {
  type        = number
  description = "Maximum size of the Auto Scaling group"
}

variable "min_size" {
  type        = number
  description = "Minimum size of the Auto Scaling group"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of EC2 instances in the group"
}

variable "health_check_grace_period" {
  type        = number
  description = "Time in seconds after instance launch before health checks begin"
}

variable "health_check_type" {
  type        = string
  description = "Health check type (EC2 or ELB)"
}

variable "default_cooldown" {
  type        = number
  description = "Default cooldown period in seconds"
}

variable "default_instance_warmup" {
  type        = number
  description = "Default instance warmup period in seconds"
}

variable "protect_from_scale_in" {
  type        = bool
  description = "Whether newly launched instances are protected from scale-in"
}

variable "capacity_rebalance" {
  type        = bool
  description = "Whether capacity rebalance is enabled"
}

variable "metrics_granularity" {
  type        = string
  description = "Granularity for metrics collection"
}

variable "service_linked_role_arn" {
  type        = string
  description = "ARN of the service-linked role for the ASG"
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "List of subnet IDs for the ASG"
}

variable "launch_template_id" {
  type        = string
  description = "ID of the launch template"
}

variable "launch_template_name" {
  type        = string
  description = "Name of the launch template"
}

variable "launch_template_version" {
  type        = string
  description = "Version of the launch template"
}

variable "capacity_distribution_strategy" {
  type        = string
  description = "Strategy for distributing capacity across AZs"
}

variable "capacity_reservation_preference" {
  type        = string
  description = "Capacity reservation preference"
}