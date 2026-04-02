output "api_ids" {
  description = "IDs of the API Gateway REST APIs"
  value       = { for k, v in aws_api_gateway_rest_api.this : k => v.id }
}

output "api_arns" {
  description = "ARNs of the API Gateway REST APIs"
  value       = { for k, v in aws_api_gateway_rest_api.this : k => v.arn }
}