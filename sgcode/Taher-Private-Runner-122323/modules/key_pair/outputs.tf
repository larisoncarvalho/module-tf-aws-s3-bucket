output "id" {
  value       = aws_key_pair.this.id
  description = "Key pair ID"
}

output "key_pair_id" {
  value       = aws_key_pair.this.key_pair_id
  description = "Key pair AWS ID"
}
