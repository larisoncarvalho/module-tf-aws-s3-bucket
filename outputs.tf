output "certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = module.stackguardian_certificate.certificate_arn
}

output "certificate_id" {
  description = "ID of the ACM certificate"
  value       = module.stackguardian_certificate.certificate_id
}

output "certificate_status" {
  description = "Status of the ACM certificate"
  value       = module.stackguardian_certificate.certificate_status
}

output "domain_validation_options" {
  description = "Domain validation options for creating DNS records"
  value       = module.stackguardian_certificate.domain_validation_options
}