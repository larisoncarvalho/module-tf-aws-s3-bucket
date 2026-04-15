resource "aws_api_gateway_rest_api" "this" {
  api_key_source           = var.api_key_source
  binary_media_types       = var.binary_media_types
  description              = var.description
  minimum_compression_size = var.minimum_compression_size
  name                     = var.name

  tags = var.tags
}