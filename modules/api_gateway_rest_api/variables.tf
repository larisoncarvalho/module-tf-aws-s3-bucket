variable "apis" {
  type = map(object({
    name                     = string
    api_key_source           = string
    binary_media_types       = list(string)
    description              = optional(string)
    minimum_compression_size = optional(number)
    tags                     = optional(map(string))
  }))
  description = "Map of API Gateway REST API configurations"
}