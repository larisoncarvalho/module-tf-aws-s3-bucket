variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "enforce_workgroup_configuration" {
  type    = bool
  default = true
}

variable "publish_cloudwatch_metrics_enabled" {
  type    = bool
  default = true
}

variable "requester_pays_enabled" {
  type    = bool
  default = false
}

variable "state" {
  type    = string
  default = "ENABLED"
}
