output "api_id" {
  description = "ID of the API Gateway REST API"
  value       = aws_api_gateway_rest_api.this.id
}

output "created_date" {
  description = "Creation date of the API Gateway REST API"
  value       = aws_api_gateway_rest_api.this.created_date
}