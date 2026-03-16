output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2_taher_private_runner_ubuntu.instance_id
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = module.ec2_taher_private_runner_ubuntu.private_ip
}

output "availability_zone" {
  description = "Availability zone of the instance"
  value       = module.ec2_taher_private_runner_ubuntu.availability_zone
}