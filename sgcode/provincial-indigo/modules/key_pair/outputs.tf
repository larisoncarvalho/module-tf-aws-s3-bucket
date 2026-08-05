output "key_name" {
  value       = aws_key_pair.this.key_name
  description = "Name of the SSH key pair"
}

output "key_pair_id" {
  value       = aws_key_pair.this.key_pair_id
  description = "ID of the key pair"
}