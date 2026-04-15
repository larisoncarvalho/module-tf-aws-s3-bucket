variable "rest_apis" {
  description = "API Gateway REST APIs to create"
  type = map(object({
    name                     = string
    description              = optional(string)
    api_key_source           = string
    binary_media_types       = optional(list(string))
    minimum_compression_size = optional(number)
    tags                     = optional(map(string))
  }))
  default = {}
}