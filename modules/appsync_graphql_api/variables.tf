variable "name" {
  type        = string
  description = "Name of the GraphQL API"
}

variable "authentication_type" {
  type        = string
  description = "Authentication type for the GraphQL API"
}

variable "xray_enabled" {
  type        = bool
  description = "Whether X-Ray tracing is enabled"
}