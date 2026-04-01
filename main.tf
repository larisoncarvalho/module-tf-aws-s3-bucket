module "api_gateway_rest_apis" {
  source = "./modules/api_gateway_rest_api"

  apis = var.apis
}