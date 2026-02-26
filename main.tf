module "docs_distribution" {
  source = "./modules/docs_cloudfront"

  aliases                = var.distribution_aliases
  comment                = var.distribution_comment
  origin_domain_name     = var.s3_origin_domain_name
  origin_id              = var.s3_origin_id
  origin_access_identity = var.cloudfront_oai
  acm_certificate_arn    = var.acm_certificate_arn
  function_arn           = var.cloudfront_function_arn
  cache_policy_id        = var.cache_policy_id
  price_class            = var.price_class
  default_root_object    = var.default_root_object
}