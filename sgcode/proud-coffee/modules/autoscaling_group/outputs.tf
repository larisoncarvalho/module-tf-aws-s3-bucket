output "asg_id" {
  value       = aws_autoscaling_group.this.id
  description = "ID of the autoscaling group"
}

output "asg_arn" {
  value       = aws_autoscaling_group.this.arn
  description = "ARN of the autoscaling group"
}