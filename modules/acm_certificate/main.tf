resource "aws_acm_certificate" "this" {
  for_each = var.certificates

  domain_name               = each.value.domain_name
  key_algorithm             = each.value.key_algorithm
  subject_alternative_names = each.value.subject_alternative_names
  validation_method         = each.value.validation_method

  tags = each.value.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "this" {
  for_each = var.certificates

  certificate_arn         = aws_acm_certificate.this[each.key].arn
  validation_record_fqdns = each.value.validation_record_fqdns
}