variable "region" {
  description = "AWS region"
  type        = string
}

variable "stulyze_app_name" {
  description = "CloudFormation stack name for the Stulyze application"
  type        = string
}

variable "stulyze_app_disable_rollback" {
  description = "Set to true to disable rollback of the stack if stack creation failed"
  type        = bool
}