output "key_name" {
  value       = aws_key_pair.this.key_name
  description = "Key pair name"
}

output "key_fingerprint" {
  value       = aws_key_pair.this.fingerprint
  description = "Key fingerprint"
}