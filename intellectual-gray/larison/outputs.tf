output "instance_id" {
  value       = module.ubuntu_debugging.instance_id
  description = "EC2 instance ID"
}

output "private_ip" {
  value       = module.ubuntu_debugging.private_ip
  description = "Private IP address of the instance"
}