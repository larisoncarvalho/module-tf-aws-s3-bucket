output "kms_key_ring_ids" {
  description = "Map of KMS key ring IDs"
  value       = { for k, v in module.kms_key_ring : k => v.id }
}
