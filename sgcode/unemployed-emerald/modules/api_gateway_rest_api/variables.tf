variable "name" {
  description = "Name of the REST API"
  type        = string
}

variable "api_key_source" {
  description = "Source of the API key for requests (HEADER or AUTHORIZER)"
  type        = string
}

variable "binary_media_types" {
  description = "List of binary media types supported by the REST API"
  type        = list(string)
}