module "sg_api_qa" {
  source = "./modules/api_gateway_rest_api"

  api_key_source     = "HEADER"
  binary_media_types = ["application/octet-stream"]
  name               = "sg-api-qa"
}