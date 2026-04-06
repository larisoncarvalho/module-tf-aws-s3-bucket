output "key_name" {
  value       = aws_key_pair.this.key_name
  description = "Name of the key pair"
}

output "key_fingerprint" {
  value       = aws_key_pair.this.fingerprint
  description = "Fingerprint of the key pair"
}