output "rest_api_id" {
  description = "ID of the REST API"
  value       = module.api_gateway_rest_api.rest_api_id
}

output "rest_api_arn" {
  description = "ARN of the REST API"
  value       = module.api_gateway_rest_api.rest_api_arn
}

output "execution_arn" {
  description = "Execution ARN of the REST API"
  value       = module.api_gateway_rest_api.execution_arn
}

output "root_resource_id" {
  description = "Resource ID of the REST API root"
  value       = module.api_gateway_rest_api.root_resource_id
}