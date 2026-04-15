resource "aws_acm_certificate" "this" {
  for_each = var.certificates

  domain_name               = each.value.domain_name
  subject_alternative_names = each.value.subject_alternative_names
  validation_method         = each.value.validation_method
  tags                      = each.value.tags
}