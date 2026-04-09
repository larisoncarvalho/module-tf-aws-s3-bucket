region = "eu-central-1"

certificates = {
  int_qa_stackguardian_io = {
    domain_name               = "*.int.qa.stackguardian.io"
    subject_alternative_names = ["*.int.qa.stackguardian.io", "int.qa.stackguardian.io"]
    validation_method         = "DNS"
    key_algorithm             = "RSA_2048"
    tags = {
      "Resource-Type" = "prod"
    }
    validation_record_fqdns = ["_25d52f45326a63dfd201f1a942675845.int.qa.stackguardian.io"]
  }
  stackguardian_io = {
    domain_name               = "stackguardian.io"
    subject_alternative_names = ["stackguardian.io", "*.qa.stackguardian.io", "*.stackguardian.io"]
    validation_method         = "DNS"
    key_algorithm             = "RSA_2048"
    tags = {
      "Name"          = "sg"
      "Resource-Type" = "prod"
    }
    validation_record_fqdns = ["_8f682aa2246fb050a27e1907c7aa4c18.stackguardian.io", "_4aedeae0d31a0fce68439d96322fee02.qa.stackguardian.io"]
  }
}