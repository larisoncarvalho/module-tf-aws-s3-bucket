output "certificate_arn" {
  value       = aws_acm_certificate.this.arn
  description = "ARN of the ACM certificate"
}

output "domain_validation_options" {
  value       = aws_acm_certificate.this.domain_validation_options
  description = "Domain validation options for the certificate"
}