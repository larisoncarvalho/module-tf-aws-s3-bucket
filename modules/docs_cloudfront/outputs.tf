output "distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.docs.id
}

output "distribution_arn" {
  description = "CloudFront distribution ARN"
  value       = aws_cloudfront_distribution.docs.arn
}

output "distribution_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.docs.domain_name
}

output "distribution_hosted_zone_id" {
  description = "CloudFront distribution hosted zone ID"
  value       = aws_cloudfront_distribution.docs.hosted_zone_id
}

output "distribution_status" {
  description = "Current status of the distribution"
  value       = aws_cloudfront_distribution.docs.status
}