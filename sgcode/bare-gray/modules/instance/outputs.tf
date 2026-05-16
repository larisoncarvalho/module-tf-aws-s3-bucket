output "instance_id" {
  value       = aws_instance.this.id
  description = "Instance ID"
}

output "private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP address"
}

output "availability_zone" {
  value       = aws_instance.this.availability_zone
  description = "Availability zone"
}