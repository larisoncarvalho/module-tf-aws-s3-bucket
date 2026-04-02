output "certificate_arn" {
  value       = module.acm_certificate.certificate_arn
  description = "ARN of the ACM certificate"
}

output "domain_validation_options" {
  value       = module.acm_certificate.domain_validation_options
  description = "Domain validation options for the certificate"
}