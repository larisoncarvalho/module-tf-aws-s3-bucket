resource "aws_api_gateway_rest_api" "this" {
  for_each = var.rest_apis

  name                     = each.value.name
  description              = each.value.description
  api_key_source           = each.value.api_key_source
  binary_media_types       = each.value.binary_media_types
  minimum_compression_size = each.value.minimum_compression_size
  tags                     = each.value.tags
}