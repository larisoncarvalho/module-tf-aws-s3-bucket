output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "instance_profile_arn" {
  description = "ARN of the IAM instance profile"
  value       = module.iam_profile.instance_profile_arn
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.security_group.security_group_id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = module.subnet.subnet_id
}

output "launch_template_id" {
  description = "ID of the launch template"
  value       = module.launch_template.launch_template_id
}

output "autoscaling_group_name" {
  description = "Name of the auto-scaling group"
  value       = module.asg.autoscaling_group_name
}