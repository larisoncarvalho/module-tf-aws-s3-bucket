variable "name" {
  description = "Name of the policy assignment"
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID to assign the policy on"
  type        = string
}

variable "policy_definition_id" {
  description = "Policy definition or set definition ID"
  type        = string
}

variable "description" {
  description = "Description of the policy assignment"
  type        = string
  default     = ""
}

variable "display_name" {
  description = "Display name of the policy assignment"
  type        = string
  default     = ""
}

variable "enforce" {
  description = "Whether enforcement is enabled (true=DoNotEnforce is false, false=DoNotEnforce)"
  type        = bool
  default     = true
}

variable "parameters" {
  description = "JSON string of parameters for the policy assignment"
  type        = string
  default     = null
}

variable "not_scopes" {
  description = "List of not scopes for the policy assignment"
  type        = list(string)
  default     = []
}
