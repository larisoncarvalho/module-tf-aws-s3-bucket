variable "certificates" {
  type = map(object({
    domain_name               = string
    subject_alternative_names = list(string)
    validation_method         = string
    key_algorithm             = string
    tags                      = map(string)
    validation_record_fqdns   = list(string)
  }))
  description = "ACM certificates to create with validation configuration"
}