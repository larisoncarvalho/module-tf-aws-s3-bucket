output "api_id" {
  description = "ID of the API Gateway REST API"
  value       = aws_api_gateway_rest_api.this.id
}

output "root_resource_id" {
  description = "Root resource ID of the API Gateway REST API"
  value       = aws_api_gateway_rest_api.this.root_resource_id
}

output "execution_arn" {
  description = "Execution ARN of the API Gateway REST API"
  value       = aws_api_gateway_rest_api.this.execution_arn
}