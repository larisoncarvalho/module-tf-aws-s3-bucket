variable "name" {
  type        = string
  description = "Name of the API Gateway REST API"
}

variable "api_key_source" {
  type        = string
  description = "Source of the API key for requests (HEADER or AUTHORIZER)"
}