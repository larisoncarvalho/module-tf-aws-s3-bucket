output "nonprod_euc1_distribution_id" {
  description = "CloudFront distribution ID for non-prod-euc1"
  value       = module.nonprod_euc1_distribution.distribution_id
}

output "nonprod_euc1_distribution_domain" {
  description = "CloudFront domain name for non-prod-euc1"
  value       = module.nonprod_euc1_distribution.domain_name
}

output "nonprod_euc1_distribution_arn" {
  description = "CloudFront distribution ARN for non-prod-euc1"
  value       = module.nonprod_euc1_distribution.distribution_arn
}

output "nonprod_euw2_distribution_id" {
  description = "CloudFront distribution ID for nonprod-euw2"
  value       = module.nonprod_euw2_distribution.distribution_id
}

output "nonprod_euw2_distribution_domain" {
  description = "CloudFront domain name for nonprod-euw2"
  value       = module.nonprod_euw2_distribution.domain_name
}

output "nonprod_euw2_distribution_arn" {
  description = "CloudFront distribution ARN for nonprod-euw2"
  value       = module.nonprod_euw2_distribution.distribution_arn
}