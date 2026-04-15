output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ubuntu_liveeo_debugging.instance_id
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = module.ubuntu_liveeo_debugging.private_ip
}