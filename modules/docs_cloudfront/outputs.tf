output "distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.docs.id
}

output "distribution_arn" {
  description = "ARN of the CloudFront distribution"
  value       = aws_cloudfront_distribution.docs.arn
}

output "distribution_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.docs.domain_name
}

output "distribution_hosted_zone_id" {
  description = "Route53 hosted zone ID for the distribution"
  value       = aws_cloudfront_distribution.docs.hosted_zone_id
}

output "distribution_status" {
  description = "Current status of the distribution"
  value       = aws_cloudfront_distribution.docs.status
}