output "api_ids" {
  description = "IDs of the API Gateway REST APIs"
  value       = { for k, v in aws_api_gateway_rest_api.this : k => v.id }
}

output "api_execution_arns" {
  description = "Execution ARNs of the API Gateway REST APIs"
  value       = { for k, v in aws_api_gateway_rest_api.this : k => v.execution_arn }
}