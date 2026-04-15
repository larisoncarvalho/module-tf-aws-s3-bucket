output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.instance.instance_id
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = module.instance.private_ip
}