output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = module.docs_cloudfront.distribution_id
}

output "cloudfront_distribution_arn" {
  description = "CloudFront distribution ARN"
  value       = module.docs_cloudfront.distribution_arn
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = module.docs_cloudfront.distribution_domain_name
}

output "cloudfront_hosted_zone_id" {
  description = "CloudFront distribution hosted zone ID for Route53"
  value       = module.docs_cloudfront.distribution_hosted_zone_id
}

output "cloudfront_status" {
  description = "Current deployment status of the distribution"
  value       = module.docs_cloudfront.distribution_status
}