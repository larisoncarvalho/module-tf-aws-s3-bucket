resource "aws_appsync_graphql_api" "this" {
  name                   = var.name
  authentication_type    = var.authentication_type
  xray_enabled           = var.xray_enabled
  introspection_config   = var.introspection_config
  query_depth_limit      = var.query_depth_limit
  resolver_count_limit   = var.resolver_count_limit
}