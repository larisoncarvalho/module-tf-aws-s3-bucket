module "acm_certificate" {
  source = "./modules/acm_certificate"

  certificates = var.certificates
}

module "api_gateway_rest_api" {
  source = "./modules/api_gateway_rest_api"

  rest_apis = var.rest_apis
}

module "appsync_graphql_api" {
  source = "./modules/appsync_graphql_api"

  authentication_type = "API_KEY"
  name                = "orchestrator-platform-api"
  xray_enabled        = false
}

module "athena_workgroup" {
  source = "./modules/athena_workgroup"

  workgroups = var.workgroups
}