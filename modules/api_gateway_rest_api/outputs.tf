output "id" {
  value       = aws_api_gateway_rest_api.this.id
  description = "ID of the REST API"
}

output "name" {
  value       = aws_api_gateway_rest_api.this.name
  description = "Name of the REST API"
}

output "arn" {
  value       = aws_api_gateway_rest_api.this.arn
  description = "ARN of the REST API"
}