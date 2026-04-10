output "api_id" {
  description = "ID of the API Gateway REST API"
  value       = module.api_gateway_rest_api.api_id
}

output "created_date" {
  description = "Creation date of the API Gateway REST API"
  value       = module.api_gateway_rest_api.created_date
}