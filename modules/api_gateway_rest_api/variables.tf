variable "name" {
  type        = string
  description = "Name of the API Gateway REST API"
}

variable "description" {
  type        = string
  description = "Description of the API Gateway REST API"
}

variable "api_key_source" {
  type        = string
  description = "Source of the API key for requests"
}

variable "binary_media_types" {
  type        = list(string)
  description = "List of binary media types supported by the REST API"
}

variable "minimum_compression_size" {
  type        = number
  description = "Minimum response size to compress for the REST API"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the API Gateway REST API"
}