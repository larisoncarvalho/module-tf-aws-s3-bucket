module "infra2code_cloudfront" {
  source = "./modules/infra2code_cloudfront"

  acm_certificate_arn         = var.acm_certificate_arn
  cache_policy_id             = var.cache_policy_id
  default_root_object         = var.default_root_object
  domain_name                 = var.domain_name
  geo_whitelist_countries     = var.geo_whitelist_countries
  logging_bucket              = var.logging_bucket
  logging_prefix              = var.logging_prefix
  price_class                 = var.price_class
  response_headers_policy_id  = var.response_headers_policy_id
  s3_origin_domain            = var.s3_origin_domain
  tags                        = var.common_tags
}