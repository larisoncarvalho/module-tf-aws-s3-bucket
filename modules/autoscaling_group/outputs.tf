output "id" {
  value       = aws_autoscaling_group.this.id
  description = "ID of the autoscaling group"
}

output "arn" {
  value       = aws_autoscaling_group.this.arn
  description = "ARN of the autoscaling group"
}

output "name" {
  value       = aws_autoscaling_group.this.name
  description = "Name of the autoscaling group"
}