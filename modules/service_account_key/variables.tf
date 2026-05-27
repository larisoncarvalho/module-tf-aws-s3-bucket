variable "service_account_keys" {
  description = "Map of service account keys to manage"
  type        = map(object({ service_account_id = string, key_algorithm = string }))
  default     = {}
}