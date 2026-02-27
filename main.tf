module "docs_cloudfront" {
  source = "./modules/docs_cloudfront"

  aliases                 = var.cloudfront_aliases
  comment                 = var.distribution_comment
  s3_origin_domain        = var.s3_origin_domain
  origin_id               = var.origin_id
  origin_access_identity  = var.origin_access_identity
  cache_policy_id         = var.cache_policy_id
  function_arn            = var.function_arn
  acm_certificate_arn     = var.acm_certificate_arn
  price_class             = var.price_class
  default_root_object     = var.default_root_object
}