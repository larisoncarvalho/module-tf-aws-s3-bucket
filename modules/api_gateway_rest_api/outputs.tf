output "api_id" {
  description = "API Gateway REST API ID"
  value       = aws_api_gateway_rest_api.this.id
}

output "created_date" {
  description = "API Gateway REST API creation date"
  value       = aws_api_gateway_rest_api.this.created_date
}