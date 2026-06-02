variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "role_arn" {
  description = "ARN of the IAM role for Lambda execution"
  type        = string
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime"
  type        = string
}

variable "timeout" {
  description = "Function timeout in seconds"
  type        = number
}

variable "memory_size" {
  description = "Memory allocated to the function in MB"
  type        = number
}

variable "architectures" {
  description = "Instruction set architecture"
  type        = list(string)
}

variable "package_type" {
  description = "Lambda deployment package type"
  type        = string
}

variable "filename" {
  description = "Path to the function deployment package"
  type        = string
}

variable "source_code_hash" {
  description = "Base64-encoded SHA256 hash of the package file"
  type        = string
}