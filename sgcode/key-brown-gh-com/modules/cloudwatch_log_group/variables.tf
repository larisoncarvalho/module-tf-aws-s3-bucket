variable "name" {
  description = "Full name (path) of the CloudWatch Log Group, including any leading slash (e.g. '/aws-glue/crawlers'). This value maps directly to the 'name' attribute of 'aws_cloudwatch_log_group' and must be unique within the AWS account and region."
  type        = string

  validation {
    condition     = length(var.name) > 0 && length(var.name) <= 512
    error_message = "name must be between 1 and 512 characters."
  }
}

variable "log_group_class" {
  description = "Log class that controls storage tier and ingestion cost. Allowed values: 'STANDARD' (full CloudWatch Logs Insights support) or 'INFREQUENT_ACCESS' (reduced cost, subset of features). Cannot be changed after the log group is created."
  type        = string
  default     = "STANDARD"

  validation {
    condition     = contains(["STANDARD", "INFREQUENT_ACCESS"], var.log_group_class)
    error_message = "log_group_class must be either 'STANDARD' or 'INFREQUENT_ACCESS'."
  }
}

variable "retention_in_days" {
  description = "Number of days CloudWatch retains log events before automatically expiring them. Use 0 (the default) to retain logs indefinitely. AWS-accepted non-zero values: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653."
  type        = number
  default     = 0
}

variable "deletion_protection_enabled" {
  description = "When true, the log group is protected from deletion via the AWS console, CLI, or API until protection is explicitly disabled. Recommended for log groups that hold audit or compliance data."
  type        = bool
  default     = false
}

variable "skip_destroy" {
  description = "When true, Terraform/OpenTofu will NOT delete the log group on 'terraform destroy' or when the resource block is removed. Useful for preserving logs that must outlive the IaC stack lifecycle."
  type        = bool
  default     = false
}

variable "region" {
  description = "AWS region in which the log group is managed (e.g. 'eu-central-1'). Used to configure the provider alias when multi-region deployments are required."
  type        = string
}