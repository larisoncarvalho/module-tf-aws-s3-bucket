module "cloudfront_distributions" {
  source   = "./modules/cloudfront_distribution"
  for_each = var.cloudfront_distributions

  aliases                        = each.value.aliases
  comment                        = each.value.comment
  default_root_object            = each.value.default_root_object
  enabled                        = each.value.enabled
  http_version                   = each.value.http_version
  is_ipv6_enabled                = each.value.is_ipv6_enabled
  price_class                    = each.value.price_class
  origins                        = each.value.origins
  default_cache_behavior         = each.value.default_cache_behavior
  custom_error_responses         = each.value.custom_error_responses
  geo_restriction_type           = each.value.geo_restriction_type
  acm_certificate_arn            = each.value.acm_certificate_arn
  ssl_support_method             = each.value.ssl_support_method
  minimum_protocol_version       = each.value.minimum_protocol_version
  cloudfront_default_certificate = each.value.cloudfront_default_certificate
  logging_enabled                = each.value.logging_enabled
  logging_bucket                 = each.value.logging_bucket
  logging_include_cookies        = each.value.logging_include_cookies
  logging_prefix                 = each.value.logging_prefix
}