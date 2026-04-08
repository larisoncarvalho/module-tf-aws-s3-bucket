resource "aws_acm_certificate" "this" {
  for_each = var.certificates

  domain_name               = each.value.domain_name
  key_algorithm             = each.value.key_algorithm
  subject_alternative_names = each.value.subject_alternative_names
  tags                      = each.value.tags
  validation_method         = each.value.validation_method

  options {
    certificate_transparency_logging_preference = each.value.certificate_transparency_logging_preference
  }
}