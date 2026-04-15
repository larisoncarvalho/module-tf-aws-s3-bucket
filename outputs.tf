output "autoscaling_group_id" {
  value       = module.autoscaling_group.id
  description = "ID of the autoscaling group"
}

output "autoscaling_group_arn" {
  value       = module.autoscaling_group.arn
  description = "ARN of the autoscaling group"
}

output "iam_role_arn" {
  value       = module.iam_role.arn
  description = "ARN of the IAM role"
}