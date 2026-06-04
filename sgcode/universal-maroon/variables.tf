variable "kms_key_rings" {
  description = "Map of KMS key ring instances to manage"
  type = map(object({
    name     = string
    location = string
    project  = string
  }))
  default = {}
}
