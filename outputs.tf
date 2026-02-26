output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = module.docs_distribution.distribution_id
}

output "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution"
  value       = module.docs_distribution.distribution_arn
}

output "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = module.docs_distribution.distribution_domain_name
}

output "cloudfront_hosted_zone_id" {
  description = "Hosted zone ID for Route53 alias records"
  value       = module.docs_distribution.distribution_hosted_zone_id
}