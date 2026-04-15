variable "rest_apis" {
  type = map(object({
    name                     = string
    description              = optional(string)
    api_key_source           = optional(string)
    binary_media_types       = optional(list(string))
    minimum_compression_size = optional(number)
    tags                     = optional(map(string))
  }))
  description = "API Gateway REST APIs to create"
  default     = {}
}