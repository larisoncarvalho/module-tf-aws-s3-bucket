resource "aws_appsync_graphql_api" "this" {
  authentication_type = var.authentication_type
  name                = var.name
  xray_enabled        = var.xray_enabled
}