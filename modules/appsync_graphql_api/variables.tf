variable "name" {
  description = "Name of the AppSync GraphQL API"
  type        = string
}

variable "authentication_type" {
  description = "Authentication type for the API"
  type        = string
}

variable "xray_enabled" {
  description = "Whether X-Ray tracing is enabled"
  type        = bool
}