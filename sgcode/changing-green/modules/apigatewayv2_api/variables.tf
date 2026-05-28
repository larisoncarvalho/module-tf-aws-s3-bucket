variable "name" {
  type        = string
  description = "Name of the API Gateway v2 API"
}

variable "protocol_type" {
  type        = string
  description = "API protocol type (HTTP or WEBSOCKET)"
}

variable "api_key_selection_expression" {
  type        = string
  description = "API key selection expression"
}

variable "route_selection_expression" {
  type        = string
  description = "Route selection expression"
}

variable "disable_execute_api_endpoint" {
  type        = bool
  description = "Whether to disable the default execute-api endpoint"
}