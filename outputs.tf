output "vpc_id" {
  description = "VPC identifier"
  value       = module.vpc_sg_nonprod_1.vpc_id
}

output "subnet_id" {
  description = "Subnet identifier"
  value       = module.subnet_app_a.subnet_id
}

output "security_group_id" {
  description = "Security group identifier"
  value       = module.security_group_default.security_group_id
}

output "instance_id" {
  description = "EC2 instance identifier"
  value       = module.instance_ecs_instances_admin_workflow_qa.instance_id
}