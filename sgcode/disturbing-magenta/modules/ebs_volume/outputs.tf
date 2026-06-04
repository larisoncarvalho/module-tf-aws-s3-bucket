# Outputs for the ebs_volume module.

output "volume_id" {
  description = "The AWS EBS volume ID."
  value       = aws_ebs_volume.this.id
}

output "arn" {
  description = "The ARN of the EBS volume."
  value       = aws_ebs_volume.this.arn
}
