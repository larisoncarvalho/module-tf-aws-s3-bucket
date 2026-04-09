variable "function_name" {
  type        = string
  description = "Name of the Lambda function"
}

variable "role_arn" {
  type        = string
  description = "ARN of the IAM role for Lambda execution"
}

variable "handler" {
  type        = string
  description = "Lambda function handler"
}

variable "runtime" {
  type        = string
  description = "Lambda runtime environment"
}

variable "memory_size" {
  type        = number
  description = "Memory size in MB"
}

variable "timeout" {
  type        = number
  description = "Function timeout in seconds"
}

variable "reserved_concurrent_executions" {
  type        = number
  description = "Reserved concurrent executions"
}

variable "architectures" {
  type        = list(string)
  description = "Instruction set architectures"
}

variable "package_type" {
  type        = string
  description = "Lambda deployment package type"
}

variable "ephemeral_storage_size" {
  type        = number
  description = "Ephemeral storage size in MB"
}

variable "tracing_mode" {
  type        = string
  description = "X-Ray tracing mode"
}