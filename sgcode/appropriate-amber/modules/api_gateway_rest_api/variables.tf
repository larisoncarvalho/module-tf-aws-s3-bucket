variable "api_name" {
  type        = string
  description = "Name of the API Gateway REST API"
}

variable "api_key_source" {
  type        = string
  description = "Source of the API key for requests"
}

variable "binary_media_types" {
  type        = list(string)
  description = "List of binary media types supported by the API"
}