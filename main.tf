module "stackguardian_cert" {
  source = "./modules/acm_certificate"

  domain_name = "stackguardian.io"
  subject_alternative_names = [
    "stackguardian.io",
    "*.qa.stackguardian.io",
    "*.stackguardian.io"
  ]
  validation_method = "DNS"
  tags = {
    Resource-Type = "prod"
    Name          = "sg"
  }
}