output "certificate_arn" {
  value = module.acm_certificate.certificate_arn
}

output "certificate_domain_name" {
  value = module.acm_certificate.domain_name
}

output "certificate_status" {
  value = module.acm_certificate.status
}