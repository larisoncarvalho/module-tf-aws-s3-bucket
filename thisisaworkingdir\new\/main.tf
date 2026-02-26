module "non_prod_euc1_distribution" {
  source = "./modules/cloudfront_non_prod_euc1"

  acm_certificate_arn        = var.acm_certificate_arn
  aliases                    = var.non_prod_euc1_aliases
  cache_policy_id            = var.non_prod_euc1_cache_policy_id
  comment                    = var.non_prod_euc1_comment
  logging_bucket             = var.logging_bucket
  logging_prefix             = var.logging_prefix
  origins                    = var.non_prod_euc1_origins
  response_headers_policy_id = var.non_prod_euc1_response_headers_policy_id
  target_origin_id           = var.non_prod_euc1_target_origin_id
}

module "nonprod_euw2_distribution" {
  source = "./modules/cloudfront_nonprod_euw2"

  acm_certificate_arn        = var.acm_certificate_arn
  aliases                    = var.nonprod_euw2_aliases
  cache_policy_id            = var.nonprod_euw2_cache_policy_id
  comment                    = var.nonprod_euw2_comment
  logging_bucket             = var.logging_bucket
  logging_prefix             = var.logging_prefix
  origins                    = var.nonprod_euw2_origins
  response_headers_policy_id = var.nonprod_euw2_response_headers_policy_id
  target_origin_id           = var.nonprod_euw2_target_origin_id
}