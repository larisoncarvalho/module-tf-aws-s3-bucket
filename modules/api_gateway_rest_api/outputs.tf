output "api_id" {
  value       = aws_api_gateway_rest_api.this.id
  description = "The ID of the REST API"
}

output "root_resource_id" {
  value       = aws_api_gateway_rest_api.this.root_resource_id
  description = "The root resource ID of the REST API"
}

output "arn" {
  value       = aws_api_gateway_rest_api.this.arn
  description = "The ARN of the REST API"
}