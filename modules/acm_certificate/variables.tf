variable "domain_name" {
  type        = string
  description = "Primary domain name for the certificate"
}

variable "subject_alternative_names" {
  type        = list(string)
  description = "Additional domain names to include in the certificate"
}

variable "validation_method" {
  type        = string
  description = "Method to use for domain validation (DNS or EMAIL)"
}