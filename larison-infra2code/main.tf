module "non_prod_euc1_distribution" {
  source = "./modules/cloudfront_non_prod_euc1"

  acm_certificate_arn    = var.acm_certificate_arn
  aliases                = var.non_prod_euc1_aliases
  comment                = var.non_prod_euc1_comment
  custom_error_responses = var.non_prod_euc1_error_responses
  default_cache_behavior = var.non_prod_euc1_cache_behavior
  logging_config         = var.logging_config
  origins                = var.non_prod_euc1_origins
}

module "nonprod_euw2_distribution" {
  source = "./modules/cloudfront_nonprod_euw2"

  acm_certificate_arn    = var.acm_certificate_arn
  aliases                = var.nonprod_euw2_aliases
  comment                = var.nonprod_euw2_comment
  custom_error_responses = var.nonprod_euw2_error_responses
  default_cache_behavior = var.nonprod_euw2_cache_behavior
  logging_config         = var.logging_config
  origins                = var.nonprod_euw2_origins
}