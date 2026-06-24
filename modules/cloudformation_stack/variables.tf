variable "name" {
  description = "Name of the CloudFormation stack"
  type        = string
}

variable "disable_rollback" {
  description = "Whether to disable rollback on stack creation failure"
  type        = bool
  default     = false
}

variable "enable_termination_protection" {
  description = "Whether termination protection is enabled"
  type        = bool
  default     = false
}

variable "notification_arns" {
  description = "List of SNS notification ARNs"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the stack"
  type        = map(string)
  default     = {}
}
