domain_name = "stackguardian.io"

subject_alternative_names = [
  "stackguardian.io",
  "*.stackguardian.io",
  "*.qa.stackguardian.io"
]

validation_method = "DNS"

key_algorithm = "RSA_2048"

certificate_transparency_logging = "ENABLED"

certificate_tags = {
  Name          = "sg"
  Resource-Type = "prod"
}