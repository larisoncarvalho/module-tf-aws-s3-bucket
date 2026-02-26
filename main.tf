module "stackguardian_certificate" {
  source = "./modules/acm_certificate"

  domain_name                      = var.domain_name
  subject_alternative_names        = var.subject_alternative_names
  validation_method                = var.validation_method
  key_algorithm                    = var.key_algorithm
  certificate_transparency_logging = var.certificate_transparency_logging
  tags                             = var.certificate_tags
}