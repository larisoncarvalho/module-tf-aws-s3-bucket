# Volume ID surfaces
# callers attach what they need—
# storage finds its host

output "volume_id" {
  description = "ID of the EBS volume"
  value       = aws_ebs_volume.this.id
}