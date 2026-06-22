variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type    = string
  default = null
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "availability_zone" {
  type    = string
  default = null
}

variable "tenancy" {
  type    = string
  default = "default"
}

variable "monitoring" {
  type    = bool
  default = false
}

variable "ebs_optimized" {
  type    = bool
  default = false
}

variable "source_dest_check" {
  type    = bool
  default = true
}

variable "network_interface_id" {
  type    = string
  default = null
}

variable "root_volume_size" {
  type    = number
  default = null
}

variable "root_volume_type" {
  type    = string
  default = null
}

variable "root_volume_delete_on_termination" {
  type    = bool
  default = true
}

variable "metadata_http_endpoint" {
  type    = string
  default = "enabled"
}

variable "metadata_http_tokens" {
  type    = string
  default = "optional"
}

variable "metadata_http_put_response_hop_limit" {
  type    = number
  default = 1
}

variable "cpu_core_count" {
  type    = number
  default = null
}

variable "cpu_threads_per_core" {
  type    = number
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
