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
  test = "test"

  tags = {
    "ZappaProject"                      = "platform-api-dev"
    "aws:cloudformation:logical-id"     = "Api"
    "aws:cloudformation:stack-id"       = "arn:aws:cloudformation:eu-central-1:790543352839:stack/platform-api-dev/4e52b040-614e-11ef-83b8-067f8cb51289"
    "aws:cloudformation:stack-name"     = "platform-api-dev"
  }
}