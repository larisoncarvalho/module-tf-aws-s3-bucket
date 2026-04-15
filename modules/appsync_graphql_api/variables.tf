variable "name" {
  type        = string
  description = "Name of the AppSync GraphQL API"
}

variable "authentication_type" {
  type        = string
  description = "Authentication type for the API"
}

variable "xray_enabled" {
  type        = bool
  description = "Whether X-Ray tracing is enabled"
}

variable "introspection_config" {
  type        = string
  description = "Introspection configuration"
}

variable "query_depth_limit" {
  type        = number
  description = "Maximum query depth limit"
}

variable "resolver_count_limit" {
  type        = number
  description = "Maximum resolver count limit"
}