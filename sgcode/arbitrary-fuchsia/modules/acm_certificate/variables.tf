variable "certificates" {
  description = "ACM certificates to create"
  type = map(object({
    domain_name               = string
    subject_alternative_names = list(string)
    validation_method         = string
    key_algorithm             = string
    tags                      = map(string)
  }))
}