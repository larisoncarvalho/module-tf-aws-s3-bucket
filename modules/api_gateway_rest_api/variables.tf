variable "rest_apis" {
  description = "API Gateway REST APIs to create"
  type = map(object({
    name                     = string
    api_key_source           = string
    binary_media_types       = optional(list(string))
    description              = optional(string)
    minimum_compression_size = optional(number)
    tags                     = map(string)
  }))
}