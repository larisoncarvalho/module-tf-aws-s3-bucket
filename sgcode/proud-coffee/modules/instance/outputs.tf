output "instance_id" {
  value       = aws_instance.this.id
  description = "ID of the EC2 instance"
}

output "instance_private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP address of the instance"
}