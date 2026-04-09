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

variable "filename" {
  type        = string
  description = "Path to the function deployment package"
}

variable "source_code_hash" {
  type        = string
  description = "Base64-encoded SHA256 hash of the package file"
}

variable "ephemeral_storage_size" {
  type        = number
  description = "Ephemeral storage size in MB"
}

variable "snap_start_apply_on" {
  type        = string
  description = "SnapStart optimization setting"
}

variable "tracing_mode" {
  type        = string
  description = "X-Ray tracing mode"
}

variable "publish" {
  type        = bool
  description = "Whether to publish creation/change as new Lambda Function Version"
}