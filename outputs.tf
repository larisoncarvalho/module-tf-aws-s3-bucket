output "lambda_role_arn" {
  description = "ARN of the Lambda autoscale role"
  value       = module.lambda_autoscale_role.role_arn
}

output "lambda_role_name" {
  description = "Name of the Lambda autoscale role"
  value       = module.lambda_autoscale_role.role_name
}

output "ec2_runner_role_arn" {
  description = "ARN of the EC2 runner role"
  value       = module.ec2_runner_role.role_arn
}

output "ec2_runner_role_name" {
  description = "Name of the EC2 runner role"
  value       = module.ec2_runner_role.role_name
}