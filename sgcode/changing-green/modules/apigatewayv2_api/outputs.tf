output "api_id" {
  description = "ID of the API Gateway v2 API"
  value       = aws_apigatewayv2_api.this.id
}

output "api_endpoint" {
  description = "Endpoint URI of the API Gateway v2 API"
  value       = aws_apigatewayv2_api.this.api_endpoint
}