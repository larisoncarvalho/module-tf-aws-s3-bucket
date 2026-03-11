output "distribution_ids" {
  description = "CloudFront distribution IDs"
  value       = { for k, v in module.cloudfront_distributions : k => v.id }
}

output "distribution_arns" {
  description = "CloudFront distribution ARNs"
  value       = { for k, v in module.cloudfront_distributions : k => v.arn }
}

output "distribution_domain_names" {
  description = "CloudFront distribution domain names"
  value       = { for k, v in module.cloudfront_distributions : k => v.domain_name }
}