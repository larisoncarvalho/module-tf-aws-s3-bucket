output "id" {
  description = "Volume ID"
  value       = aws_ebs_volume.this.id
}

output "arn" {
  description = "Volume ARN"
  value       = aws_ebs_volume.this.arn
}
