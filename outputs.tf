output "api_ids" {
  description = "Map of API Gateway REST API IDs"
  value       = { for k, v in module.api_gateway_rest_apis : k => v.api_id }
}

output "api_arns" {
  description = "Map of API Gateway REST API ARNs"
  value       = { for k, v in module.api_gateway_rest_apis : k => v.arn }
}