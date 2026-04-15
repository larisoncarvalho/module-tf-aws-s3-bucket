output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = module.infra2code_cloudfront.cloudfront_distribution_id
}

output "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution"
  value       = module.infra2code_cloudfront.cloudfront_distribution_arn
}

output "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution (d20gfgisn1pzpp.cloudfront.net)"
  value       = module.infra2code_cloudfront.cloudfront_domain_name
}

output "cloudfront_hosted_zone_id" {
  description = "Hosted zone ID for Route53 alias records"
  value       = module.infra2code_cloudfront.cloudfront_hosted_zone_id
}

output "origin_access_identity_id" {
  description = "CloudFront Origin Access Identity ID"
  value       = module.infra2code_cloudfront.origin_access_identity_id
}