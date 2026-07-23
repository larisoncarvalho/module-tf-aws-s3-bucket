variable "lambda_package_path" {
  type        = string
  description = "Path to the Lambda deployment package zip file"
}

variable "lambda_source_code_hash" {
  type        = string
  description = "Base64-encoded SHA256 hash of the Lambda package"
}