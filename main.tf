module "acm_certificates" {
  source = "./modules/acm_certificate"
  certificates = var.certificates
}

module "platform_api_dev" {
  source = "./modules/api_gateway_rest_api"

  api_key_source           = "HEADER"
  binary_media_types       = ["*/*"]
  description              = "Created automatically by Zappa."
  minimum_compression_size = 0
  name                     = "platform-api-dev"
  test = 21
  tags = {
    "ZappaProject" = "platform-api-dev"
  }
}