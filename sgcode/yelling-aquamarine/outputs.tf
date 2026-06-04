output "kms_key_ring_id" {
  description = "The identifier of the KMS Key Ring"
  value       = module.kms_key_ring.id
}