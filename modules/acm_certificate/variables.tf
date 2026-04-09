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

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}