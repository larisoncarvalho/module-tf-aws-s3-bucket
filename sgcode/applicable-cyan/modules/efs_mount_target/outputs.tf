output "mount_target_ids" {
  value       = { for k, v in aws_efs_mount_target.this : k => v.id }
  description = "Map of mount target IDs"
}