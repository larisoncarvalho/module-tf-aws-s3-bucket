variable "name" {
  type = string
}

variable "replication_strategy" {
  type    = string
  default = "SINGLE_REGION"
}

variable "tags" {
  type    = map(string)
  default = {}
}
