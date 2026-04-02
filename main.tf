module "qa_certificate" {
  source = "./modules/acm_certificate"

  domain_name               = "*.int.qa.stackguardian.io"
  subject_alternative_names = ["*.int.qa.stackguardian.io", "int.qa.stackguardian.io"]
  validation_method         = "DNS"
  validation_record_fqdns   = ["_25d52f45326a63dfd201f1a942675845.int.qa.stackguardian.io."]
  tags = {
    Resource-Type = "prod"
  }
}