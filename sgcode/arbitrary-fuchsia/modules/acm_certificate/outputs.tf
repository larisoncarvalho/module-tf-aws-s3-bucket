output "certificate_arns" {
  description = "ARNs of the ACM certificates"
  value       = { for k, v in aws_acm_certificate.this : k => v.arn }
}