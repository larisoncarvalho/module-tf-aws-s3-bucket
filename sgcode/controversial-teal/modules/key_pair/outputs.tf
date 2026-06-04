# Key name surfaces
# instance binds to the pair—
# access flows secure

output "key_name" {
  description = "Name of the key pair"
  value       = aws_key_pair.this.key_name
}