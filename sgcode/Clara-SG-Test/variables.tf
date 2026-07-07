variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "service_accounts" {
  description = "Map of service accounts to manage"
  type = map(object({
    account_id   = string
    display_name = optional(string, "")
    description  = optional(string, "")
    disabled     = optional(bool, false)
  }))
  default = {}
}
