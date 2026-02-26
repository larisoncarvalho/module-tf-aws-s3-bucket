module "nonprod_euc1_distribution" {
  # brand new comment to test working dir
  source = "./modules/cloudfront_distribution_nonprod_euc1"

  acm_certificate_arn        = var.acm_certificate_arn
  aliases                    = var.nonprod_euc1_aliases
  cache_policy_id            = var.nonprod_euc1_cache_policy_id
  comment                    = var.nonprod_euc1_comment
  custom_error_responses     = var.nonprod_euc1_custom_error_responses
  default_root_object        = var.nonprod_euc1_default_root_object
  enabled                    = var.nonprod_euc1_enabled
  logging_bucket             = var.logging_bucket
  logging_prefix             = var.nonprod_euc1_logging_prefix
  origins                    = var.nonprod_euc1_origins
  response_headers_policy_id = var.nonprod_euc1_response_headers_policy_id
}

module "nonprod_euw2_distribution" {
  source = "./modules/cloudfront_distribution_nonprod_euw2"

  acm_certificate_arn        = var.acm_certificate_arn
  aliases                    = var.nonprod_euw2_aliases
  cache_policy_id            = var.nonprod_euw2_cache_policy_id
  comment                    = var.nonprod_euw2_comment
  custom_error_responses     = var.nonprod_euw2_custom_error_responses
  default_root_object        = var.nonprod_euw2_default_root_object
  enabled                    = var.nonprod_euw2_enabled
  logging_bucket             = var.logging_bucket
  logging_prefix             = var.nonprod_euw2_logging_prefix
  origins                    = var.nonprod_euw2_origins
  response_headers_policy_id = var.nonprod_euw2_response_headers_policy_id
}