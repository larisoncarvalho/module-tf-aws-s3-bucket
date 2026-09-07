variable "region" {
  description = "AWS region where resources are managed"
  type        = string
}

variable "log_group_name" {
  description = "The name of the CloudWatch Log Group"
  type        = string
}

variable "log_group_class" {
  description = "The log class of the log group"
  type        = string
}

variable "retention_in_days" {
  description = "Number of days to retain log events; 0 means never expire"
  type        = number
}

variable "deletion_protection_enabled" {
  description = "Whether deletion protection is enabled on the log group"
  type        = bool
}

variable "skip_destroy" {
  description = "If true, the log group will not be deleted on destroy"
  type        = bool
}