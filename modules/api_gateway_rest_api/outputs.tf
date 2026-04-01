output "api_id" {
  description = "Map of API Gateway REST API IDs"
  value       = { for k, v in aws_api_gateway_rest_api.this : k => v.id }
}

output "arn" {
  description = "Map of API Gateway REST API ARNs"
  value       = { for k, v in aws_api_gateway_rest_api.this : k => v.arn }
}