output "instance_id" {
  description = "EC2 instance identifier"
  value       = aws_instance.this.id
}