module "acm_certificate" {
  source = "./modules/acm_certificate"

  domain_name               = "*.int.qa.stackguardian.io"
  subject_alternative_names = ["*.int.qa.stackguardian.io", "int.qa.stackguardian.io"]
  validation_method         = "DNS"
  tags = {
    Resource-Type = "prod"
  }
}