module "acm_certificates" {
  source = "./modules/acm_certificate"

  certificates = var.certificates
}

module "api_gateway_apis" {
  source = "./modules/api_gateway_rest_api"

  rest_apis = var.rest_apis
}

module "appsync_api" {
  source = "./modules/appsync_graphql_api"

  name                   = "orchestrator-platform-api"
  authentication_type    = "API_KEY"
  xray_enabled           = false
  introspection_config   = "ENABLED"
  query_depth_limit      = 0
  resolver_count_limit   = 0
}

module "athena_workgroups" {
  source = "./modules/athena_workgroup"

  workgroups = var.athena_workgroups
}