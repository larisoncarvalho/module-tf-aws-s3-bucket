output "volume_id" {
  description = "EBS volume identifier"
  value       = aws_ebs_volume.this.id
}