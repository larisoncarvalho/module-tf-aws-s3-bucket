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
  description = "Lambda runtime environment"
  type        = string
}

variable "memory_size" {
  description = "Amount of memory in MB allocated to the function"
  type        = number
}

variable "timeout" {
  description = "Function execution timeout in seconds"
  type        = number
}

variable "reserved_concurrent_executions" {
  description = "Reserved concurrent executions for the function"
  type        = number
}

variable "architectures" {
  description = "Instruction set architecture for the function"
  type        = list(string)
}

variable "package_type" {
  description = "Lambda deployment package type"
  type        = string
}

variable "ephemeral_storage_size" {
  description = "Size of ephemeral storage in MB"
  type        = number
}

variable "tracing_mode" {
  description = "X-Ray tracing mode"
  type        = string
}

variable "filename" {
  description = "Path to the function's deployment package"
  type        = string
}