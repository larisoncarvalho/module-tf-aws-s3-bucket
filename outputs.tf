output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = module.iam_role.role_arn
}

output "iam_role_name" {
  description = "Name of the IAM role"
  value       = module.iam_role.role_name
}

output "asg_id" {
  description = "ID of the Auto Scaling Group"
  value       = module.autoscaling_group.asg_id
}

output "asg_arn" {
  description = "ARN of the Auto Scaling Group"
  value       = module.autoscaling_group.asg_arn
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.autoscaling_group.asg_name
}