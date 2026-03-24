output "autoscale_lambda_role_arn" {
  description = "ARN of the autoscale Lambda role"
  value       = module.neha_private_runner_autoscale_lambda_role.role_arn
}

output "ec2_private_runner_role_arn" {
  description = "ARN of the EC2 private runner role"
  value       = module.neha_private_runner_ec2_private_runner_role.role_arn
}