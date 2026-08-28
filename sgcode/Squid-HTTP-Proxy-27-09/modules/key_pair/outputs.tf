output "id" {
  description = "Key pair ID"
  value       = aws_key_pair.this.id
}

output "key_pair_id" {
  description = "Key pair resource ID"
  value       = aws_key_pair.this.key_pair_id
}
