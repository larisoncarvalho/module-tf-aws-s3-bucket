variable "service_account_keys" {
  description = "Map of service account keys to manage, keyed by key fingerprint"
  type        = map(object({ service_account_id = string }))
  default     = {}
}