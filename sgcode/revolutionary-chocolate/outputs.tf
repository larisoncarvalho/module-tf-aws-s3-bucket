output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.instance.instance_id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.instance.instance_private_ip
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = module.instance.subnet_id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.instance.vpc_id
}