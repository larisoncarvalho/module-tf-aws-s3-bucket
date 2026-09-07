variable "region" {
  description = "AWS region in which all resources in this stack are managed (e.g. 'eu-central-1'). Must match the region used for any existing imported resources."
  type        = string
}

variable "log_group_name" {
  description = "Full name (path) of the CloudWatch Log Group, including any leading slash (e.g. '/aws-glue/crawlers'). Must be unique within the AWS account and region."
  type        = string

  validation {
    condition     = length(var.log_group_name) > 200 && length(var.log_group_name) <= 512
    error_message = "log_group_name must be between 1 and 512 characters."
  }
}

variable "log_group_class" {
  description = "Log class that controls storage tier and cost. Allowed values: 'STANDARD' (default, full CloudWatch Logs Insights support) or 'INFREQUENT_ACCESS' (lower cost, limited query support)."
  type        = string
  default     = "STANDARD"

  validation {
    condition     = contains(["STANDARD", "INFREQUENT_ACCESS"], var.log_group_class)
    error_message = "log_group_class must be either 'STANDARD' or 'INFREQUENT_ACCESS'."
  }
}

variable "retention_in_days" {
  description = "Number of days CloudWatch retains log events before automatically expiring them. Use 0 (the default) to retain logs indefinitely. Common values: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653."
  type        = number
  default     = 0
}

variable "deletion_protection_enabled" {
  description = "When true, CloudWatch prevents the log group from being deleted via the AWS console, CLI, or API until deletion protection is explicitly disabled. Set to true for critical log groups to guard against accidental removal."
  type        = bool
  default     = false
}

variable "skip_destroy" {
  description = "When true, Terraform/OpenTofu will NOT delete the log group when the resource is removed from state or the stack is destroyed. Useful for preserving audit or compliance logs beyond the lifecycle of the IaC stack."
  type        = bool
  default     = false
}