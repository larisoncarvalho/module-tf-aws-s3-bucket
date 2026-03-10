output "distribution_ids" {
  description = "Map of CloudFront distribution IDs"
  value       = { for k, v in module.cloudfront_distributions : k => v.id }
}

output "distribution_arns" {
  description = "Map of CloudFront distribution ARNs"
  value       = { for k, v in module.cloudfront_distributions : k => v.arn }
}

output "distribution_domain_names" {
  description = "Map of CloudFront distribution domain names"
  value       = { for k, v in module.cloudfront_distributions : k => v.domain_name }
}