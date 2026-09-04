variable "lambda_functions" {
  description = "Map of Lambda function configurations"
  type = map(object({
    function_name                     = string
    architectures                     = optional(list(string), ["x86_64"])
    memory_size                       = optional(number, 128)
    timeout                           = optional(number, 3)
    package_type                      = optional(string, "Zip")
    image_uri                         = optional(string, null)
    lambda_role                       = optional(string, null)
    tracing_mode                      = optional(string, null)
    environment_variables             = optional(map(string), {})
    cloudwatch_logs_retention_in_days = optional(number, null)
    ignore_source_code_hash           = optional(bool, false)
  }))
  default = {}
}

variable "lambda_sg_api_keys" {
  description = "Map of SG_API_KEY per lambda function key (sensitive)"
  type        = map(string)
  sensitive   = true
  default     = {}
}
