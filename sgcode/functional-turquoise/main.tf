module "acm_certificates" {
  source = "./modules/acm_certificate"

  certificates = var.certificates
}

module "api_gateway_rest_apis" {
  source = "./modules/api_gateway_rest_api"

  rest_apis = var.rest_apis
}

module "appsync_api" {
  source = "./modules/appsync_graphql_api"

  authentication_type = "API_KEY"
  name                = "orchestrator-platform-api"
  xray_enabled        = false
}

module "athena_workgroups" {
  source = "./modules/athena_workgroup"

  workgroups = var.athena_workgroups
}