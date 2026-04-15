output "autoscaling_group_id" {
  description = "Auto Scaling Group ID"
  value       = module.neha_private_runner_asg.id
}

output "autoscaling_group_arn" {
  description = "Auto Scaling Group ARN"
  value       = module.neha_private_runner_asg.arn
}

output "instance_ids" {
  description = "EC2 instance IDs"
  value       = { for k, v in module.ec2_instances : k => v.id }
}

output "instance_public_ips" {
  description = "EC2 instance public IPs"
  value       = { for k, v in module.ec2_instances : k => v.public_ip }
}