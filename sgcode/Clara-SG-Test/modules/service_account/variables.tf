variable "account_id" {
  description = "The account ID of the service account"
  type        = string
}

variable "display_name" {
  description = "The display name of the service account"
  type        = string
  default     = ""
}

variable "description" {
  description = "The description of the service account"
  type        = string
  default     = ""
}

variable "disabled" {
  description = "Whether the service account is disabled"
  type        = bool
  default     = false
}
