variable "domain_name" {
  type        = string
  description = "Primary domain name for the certificate"
}

variable "subject_alternative_names" {
  type        = list(string)
  description = "Subject alternative names for the certificate"
}

variable "validation_method" {
  type        = string
  description = "Certificate validation method"
}

variable "validation_record_fqdns" {
  type        = list(string)
  description = "DNS validation record FQDNs for certificate validation"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}