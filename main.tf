module "de_manuel_meireles_primary_workgroup" {
  source = "./modules/athena_workgroup"

  name                               = "de-manuel-meireles-primary-workgroup"
  description                        = "Primary Athena workgroup for de-manuel-meireles"
  state                              = "ENABLED"
  bytes_scanned_cutoff_per_query     = 10737418240
  enforce_workgroup_configuration    = true
  publish_cloudwatch_metrics_enabled = true
  requester_pays_enabled             = false
  output_location                    = "s3://de-manuel-meireles-infra-athena-results/query-results/"
  encryption_option                  = "SSE_S3"
  selected_engine_version            = "AUTO"
  tags = {
    Architecture = "medallion"
    Environment  = "de-manuel-meireles"
    ManagedBy    = "terraform"
    Project      = "data-lake"
  }
}

module "platform_api_dev" {
  source = "./modules/api_gateway_rest_api"

  name                     = "platform-api-dev"
  description              = "Created automatically by Zappa."
  api_key_source           = "HEADER"
  binary_media_types       = ["*/*"]
  minimum_compression_size = 0
  tags = {
    "aws:cloudformation:stack-name"  = "platform-api-dev"
    "aws:cloudformation:logical-id"  = "Api"
    "aws:cloudformation:stack-id"    = "arn:aws:cloudformation:eu-central-1:790543352839:stack/platform-api-dev/4e52b040-614e-11ef-83b8-067f8cb51289"
    ZappaProject                     = "platform-api-dev"
  }
}

module "sg_api_qa" {
  source = "./modules/api_gateway_rest_api"

  name                     = "sg-api-qa"
  description              = null
  api_key_source           = "HEADER"
  binary_media_types       = ["application/octet-stream"]
  minimum_compression_size = null
  tags                     = {}
}

module "arunim_test_api" {
  source = "./modules/api_gateway_rest_api"

  name                     = "arunim-test-api"
  description              = null
  api_key_source           = "HEADER"
  binary_media_types       = null
  minimum_compression_size = null
  tags                     = {}
}