variable "region" {
  type        = string
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "name" {
  type        = string
  description = "CloudFormation stack name"
  default     = "stulyze-app"
}

variable "disable_rollback" {
  type        = bool
  description = "Set to true to disable rollback of the stack if stack creation failed"
  default     = false
}