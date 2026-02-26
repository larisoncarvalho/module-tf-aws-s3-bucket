output "certificate_arn" {
  description = "ARN of the certificate"
  value       = aws_acm_certificate.stackguardian.arn
}

output "certificate_id" {
  description = "ID of the certificate"
  value       = aws_acm_certificate.stackguardian.id
}

output "certificate_domain_name" {
  description = "Domain name of the certificate"
  value       = aws_acm_certificate.stackguardian.domain_name
}

output "certificate_status" {
  description = "Status of the certificate"
  value       = aws_acm_certificate.stackguardian.status
}

output "domain_validation_options" {
  description = "Domain validation options for DNS records"
  value       = aws_acm_certificate.stackguardian.domain_validation_options
}