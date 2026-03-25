output "instance_id" {
  value       = module.ec2_instance.instance_id
  description = "EC2 instance ID"
}

output "private_ip" {
  value       = module.ec2_instance.private_ip
  description = "Private IP address of the instance"
}

output "public_ip" {
  value       = module.ec2_instance.public_ip
  description = "Public IP address of the instance"
}