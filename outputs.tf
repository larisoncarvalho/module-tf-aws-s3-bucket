output "certificate_arn" {
  value       = module.acm_certificate.certificate_arn
  description = "ARN of the ACM certificate"
}

output "certificate_domain" {
  value       = module.acm_certificate.domain_name
  description = "Domain name of the certificate"
}

output "certificate_status" {
  value       = module.acm_certificate.status
  description = "Status of the certificate"
}