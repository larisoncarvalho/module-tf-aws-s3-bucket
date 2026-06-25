variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_type" {
  type = string
}

variable "create_option" {
  type    = string
  default = "Empty"
}

variable "disk_size_gb" {
  type    = number
  default = null
}

variable "os_type" {
  type    = string
  default = null
}

variable "hyper_v_generation" {
  type    = string
  default = null
}

variable "image_reference_id" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
