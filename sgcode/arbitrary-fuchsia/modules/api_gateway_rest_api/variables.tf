variable "rest_apis" {
  description = "API Gateway REST APIs to create"
  type = map(object({
    name                     = string
    description              = string
    api_key_source           = string
    binary_media_types       = list(string)
    minimum_compression_size = number
    tags                     = map(string)
  }))
}