output "distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.non_prod_euc1.id
}

output "distribution_arn" {
  description = "CloudFront distribution ARN"
  value       = aws_cloudfront_distribution.non_prod_euc1.arn
}

output "distribution_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.non_prod_euc1.domain_name
}

output "distribution_status" {
  description = "CloudFront distribution status"
  value       = aws_cloudfront_distribution.non_prod_euc1.status
}