resource "aws_acm_certificate" "stackguardian" {
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
  key_algorithm             = var.key_algorithm

  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}