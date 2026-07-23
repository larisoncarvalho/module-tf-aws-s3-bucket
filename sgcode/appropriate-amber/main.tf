module "api_gateway" {
  source = "./modules/api_gateway_rest_api"

  api_name             = "sg-api-qa"
  api_key_source       = "HEADER"
  binary_media_types   = ["application/octet-stream"]
}