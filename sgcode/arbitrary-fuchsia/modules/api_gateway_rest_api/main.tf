resource "aws_api_gateway_rest_api" "this" {
  for_each = var.rest_apis

  api_key_source           = each.value.api_key_source
  binary_media_types       = each.value.binary_media_types
  description              = each.value.description != "" ? each.value.description : null
  minimum_compression_size = each.value.minimum_compression_size >= 0 ? each.value.minimum_compression_size : null
  name                     = each.value.name

  tags = each.value.tags
}