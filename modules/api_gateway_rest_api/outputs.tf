output "api_id" {
  value       = aws_api_gateway_rest_api.this.id
  description = "ID of the API Gateway REST API"
}

output "api_arn" {
  value       = aws_api_gateway_rest_api.this.arn
  description = "ARN of the API Gateway REST API"
}

output "root_resource_id" {
  value       = aws_api_gateway_rest_api.this.root_resource_id
  description = "Root resource ID of the API Gateway REST API"
}