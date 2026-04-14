module "api_gateway_rest_api" {
  source         = "./modules/api_gateway_rest_api"
  name           = "arunim-test-api"
  api_key_source = "HEADER"
}