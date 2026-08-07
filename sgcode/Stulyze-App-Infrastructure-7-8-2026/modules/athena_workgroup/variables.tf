variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "state" {
  type    = string
  default = "ENABLED"
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

variable "selected_engine_version" {
  type    = string
  default = "AUTO"
}

variable "tags" {
  type    = map(string)
  default = {}
}
