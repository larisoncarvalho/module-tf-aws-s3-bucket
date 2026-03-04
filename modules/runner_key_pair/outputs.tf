output "key_name" {
  description = "Name of the key pair"
  value       = aws_key_pair.runner.key_name
}

output "key_fingerprint" {
  description = "Fingerprint of the key pair"
  value       = aws_key_pair.runner.fingerprint
}