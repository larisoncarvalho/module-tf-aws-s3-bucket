output "arn" {
  value       = aws_acm_certificate.this.arn
  description = "ARN of the ACM certificate"
}

output "domain_name" {
  value       = aws_acm_certificate.this.domain_name
  description = "Domain name of the ACM certificate"
}

output "status" {
  value       = aws_acm_certificate.this.status
  description = "Status of the ACM certificate"
}