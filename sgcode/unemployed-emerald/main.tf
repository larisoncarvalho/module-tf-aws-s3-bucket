module "api_gateway_rest_api" {
  source             = "./modules/api_gateway_rest_api"
  name               = var.name
  api_key_source     = var.api_key_source
  binary_media_types = var.binary_media_types
}