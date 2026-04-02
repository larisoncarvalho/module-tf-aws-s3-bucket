resource "aws_appsync_graphql_api" "this" {
  name                = var.name
  authentication_type = var.authentication_type
  xray_enabled        = var.xray_enabled
}