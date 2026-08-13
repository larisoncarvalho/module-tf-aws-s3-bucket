output "distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.nonprod_euc1.id
}

output "distribution_arn" {
  description = "CloudFront distribution ARN"
  value       = aws_cloudfront_distribution.nonprod_euc1.arn
}

output "domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.nonprod_euc1.domain_name
}

output "status" {
  description = "Current status of the distribution"
  value       = aws_cloudfront_distribution.nonprod_euc1.status
}