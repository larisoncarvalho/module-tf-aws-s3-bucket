resource "aws_api_gateway_rest_api" "this" {
  api_key_source = var.api_key_source
  name           = var.api_name
}