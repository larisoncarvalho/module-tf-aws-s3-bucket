module "cloudfront_distributions" {
  for_each = var.cloudfront_distributions
  source   = "./modules/cloudfront_distribution"

  aliases                 = each.value.aliases
  comment                 = each.value.comment
  custom_error_responses  = each.value.custom_error_responses
  default_cache_behavior  = each.value.default_cache_behavior
  default_root_object     = each.value.default_root_object
  enabled                 = each.value.enabled
  http_version            = each.value.http_version
  is_ipv6_enabled         = each.value.is_ipv6_enabled
  logging_config          = each.value.logging_config
  origins                 = each.value.origins
  price_class             = each.value.price_class
  restrictions            = each.value.restrictions
  viewer_certificate      = each.value.viewer_certificate
}