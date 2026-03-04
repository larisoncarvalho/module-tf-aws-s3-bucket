output "root_volume_id" {
  description = "ID of the root volume"
  value       = aws_ebs_volume.root.id
}

output "data_volume_id" {
  description = "ID of the data volume"
  value       = aws_ebs_volume.data.id
}