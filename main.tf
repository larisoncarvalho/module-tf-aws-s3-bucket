module "docs_distribution" {
  source = "./modules/docs_cloudfront"

  acm_certificate_arn    = var.acm_certificate_arn
  aliases                = var.distribution_aliases
  cache_policy_id        = var.cache_policy_id
  comment                = var.distribution_comment
  custom_error_responses = var.custom_error_responses
  default_root_object    = var.default_root_object
  function_arn           = var.cloudfront_function_arn
  origin_access_identity = var.origin_access_identity
  origin_domain_name     = var.origin_domain_name
  origin_id              = var.origin_id
  price_class            = var.price_class
}