output "certificate_arns" {
  description = "ARNs of the ACM certificates"
  value       = { for k, v in aws_acm_certificate.this : k => v.arn }
}

output "certificate_domain_validation_options" {
  description = "Domain validation options for the ACM certificates"
  value       = { for k, v in aws_acm_certificate.this : k => v.domain_validation_options }
}