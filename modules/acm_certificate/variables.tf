variable "domain_name" {
  description = "Primary domain name for the certificate"
  type        = string
}

variable "subject_alternative_names" {
  description = "Subject alternative names for the certificate"
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "Certificate validation method (DNS or EMAIL)"
  type        = string
  default     = "DNS"
}

variable "key_algorithm" {
  description = "Key algorithm for the certificate"
  type        = string
  default     = "RSA_2048"
}

variable "certificate_transparency_logging" {
  description = "Certificate transparency logging preference"
  type        = string
  default     = "ENABLED"
}

variable "tags" {
  description = "Tags to apply to the certificate"
  type        = map(string)
  default     = {}
}