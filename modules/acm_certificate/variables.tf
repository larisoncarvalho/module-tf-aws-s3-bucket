variable "certificates" {
  type = map(object({
    domain_name               = string
    subject_alternative_names = list(string)
    validation_method         = string
    tags                      = map(string)
  }))
  description = "ACM certificates to create with domain validation configuration"
  default     = {}
}