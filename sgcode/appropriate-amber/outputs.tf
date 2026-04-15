output "api_id" {
  description = "ID of the API Gateway REST API"
  value       = module.api_gateway.api_id
}

output "created_date" {
  description = "Creation date of the API Gateway REST API"
  value       = module.api_gateway.created_date
}