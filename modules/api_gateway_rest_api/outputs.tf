output "api_id" {
  value       = aws_api_gateway_rest_api.this.id
  description = "The ID of the REST API"
}

output "created_date" {
  value       = aws_api_gateway_rest_api.this.created_date
  description = "The creation date of the REST API"
}