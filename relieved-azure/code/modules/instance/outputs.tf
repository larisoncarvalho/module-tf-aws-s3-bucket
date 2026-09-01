output "instance_id" {
  value       = aws_instance.this.id
  description = "ID of the EC2 instance"
}

output "private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP address of the instance"
}

output "public_ip" {
  value       = aws_instance.this.public_ip
  description = "Public IP address of the instance"
}

output "arn" {
  value       = aws_instance.this.arn
  description = "ARN of the EC2 instance"
}