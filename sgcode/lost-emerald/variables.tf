variable "region" {
  description = "AWS region"
  type        = string
}

variable "lambda_basic_execution_policy_arn" {
  description = "ARN of the Lambda basic execution policy"
  type        = string
}

variable "lambda_package_path" {
  description = "Path to the Lambda deployment package"
  type        = string
}

variable "lambda_source_code_hash" {
  description = "Base64-encoded SHA256 hash of the Lambda package"
  type        = string
}