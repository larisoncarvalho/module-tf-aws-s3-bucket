output "key_name" {
  description = "Name of the EC2 key pair"
  value       = aws_key_pair.this.key_name
}