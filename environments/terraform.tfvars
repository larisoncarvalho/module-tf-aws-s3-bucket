region = "eu-central-1"

apis = {
  sg_api_qa = {
    name                     = "sg-api-qa"
    api_key_source           = "HEADER"
    binary_media_types       = ["application/octet-stream"]
    description              = null
    minimum_compression_size = null
    tags                     = null
  }
  platform_api_dev = {
    name                     = "platform-api-dev"
    api_key_source           = "HEADER"
    binary_media_types       = ["*/*"]
    description              = "Created automatically by Zappa."
    minimum_compression_size = 0
    tags = {
      "aws:cloudformation:stack-name"  = "platform-api-dev"
      "aws:cloudformation:logical-id"  = "Api"
      "aws:cloudformation:stack-id"    = "arn:aws:cloudformation:eu-central-1:790543352839:stack/platform-api-dev/4e52b040-614e-11ef-83b8-067f8cb51289"
      "ZappaProject"                   = "platform-api-dev"
    }
  }
}