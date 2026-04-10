output "api_id" {
  description = "API Gateway REST API ID"
  value       = module.api_gateway_rest_api.api_id
}

output "api_created_date" {
  description = "API Gateway REST API creation date"
  value       = module.api_gateway_rest_api.created_date
}