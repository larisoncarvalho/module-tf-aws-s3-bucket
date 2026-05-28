resource "aws_apigatewayv2_api" "this" {
  name                          = var.name
  protocol_type                 = var.protocol_type
  api_key_selection_expression  = var.api_key_selection_expression
  disable_execute_api_endpoint  = var.disable_execute_api_endpoint
  route_selection_expression    = var.route_selection_expression
}