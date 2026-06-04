output "id" {
  description = "The ID of the KMS key ring"
  value       = google_kms_key_ring.this.id
}
