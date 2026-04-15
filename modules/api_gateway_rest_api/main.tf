resource "aws_api_gateway_rest_api" "this" {
  api_key_source     = var.api_key_source
  binary_media_types = var.binary_media_types
  name               = var.name
}