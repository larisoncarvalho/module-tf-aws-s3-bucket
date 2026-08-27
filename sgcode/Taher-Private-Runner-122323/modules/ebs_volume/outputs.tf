output "id" {
  value       = aws_ebs_volume.this.id
  description = "Volume ID"
}

output "arn" {
  value       = aws_ebs_volume.this.arn
  description = "Volume ARN"
}
