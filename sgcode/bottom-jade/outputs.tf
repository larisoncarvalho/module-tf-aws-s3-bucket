output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = module.lambda_function.function_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda_function.function_arn
}

output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = module.iam_role.role_arn
}