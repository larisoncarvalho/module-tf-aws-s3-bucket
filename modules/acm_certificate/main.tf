resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  key_algorithm             = var.key_algorithm
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method

  tags = var.tags
}