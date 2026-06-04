# Outputs for the key_pair module.

output "key_pair_id" {
  description = "The AWS key pair ID."
  value       = aws_key_pair.this.id
}

output "key_name" {
  description = "The key pair name."
  value       = aws_key_pair.this.key_name
}
