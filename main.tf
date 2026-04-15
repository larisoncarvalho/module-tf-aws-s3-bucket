module "docs_distribution" {
  source = "./modules/docs_cloudfront"

  aliases                      = var.distribution_aliases
  comment                      = var.distribution_comment
  default_root_object          = var.default_root_object
  enabled                      = var.distribution_enabled
  is_ipv6_enabled              = var.ipv6_enabled
  price_class                  = var.price_class
  http_version                 = var.http_version
  s3_origin_domain             = var.s3_origin_domain
  s3_origin_id                 = var.s3_origin_id
  origin_access_identity       = var.origin_access_identity
  cache_policy_id              = var.cache_policy_id
  viewer_request_function_arn  = var.viewer_request_function_arn
  acm_certificate_arn          = var.acm_certificate_arn
  minimum_protocol_version     = var.minimum_protocol_version
  custom_error_responses       = var.custom_error_responses
  tags                         = var.distribution_tags
  
}