output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda_function.function_arn
}

output "lambda_role_arn" {
  description = "ARN of the Lambda IAM role"
  value       = module.iam_role.role_arn
}