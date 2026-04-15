resource "aws_api_gateway_rest_api" "this" {
  for_each = var.apis

  api_key_source           = each.value.api_key_source
  binary_media_types       = each.value.binary_media_types
  description              = each.value.description
  minimum_compression_size = each.value.minimum_compression_size
  name                     = each.value.name
  tags                     = each.value.tags
}