variable "name" {
  description = "Auto-scaling group name"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for ASG"
  type        = list(string)
  default     = []
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type        = number
  default     = 1
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
  default     = 1
}

variable "launch_template_id" {
  description = "Launch template ID"
  type        = string
}