output "role_arn" {
  value       = module.lambda_edge_role.role_arn
  description = "ARN of the Lambda@Edge execution role"
}

output "role_name" {
  value       = module.lambda_edge_role.role_name
  description = "Name of the Lambda@Edge execution role"
}