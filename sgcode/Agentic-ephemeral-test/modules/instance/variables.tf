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

variable "source_dest_check" {
  type    = bool
  default = true
}

variable "ebs_optimized" {
  type    = bool
  default = false
}

variable "root_volume_type" {
  type    = string
  default = "gp2"
}

variable "root_volume_size" {
  type    = number
  default = 8
}

variable "root_volume_iops" {
  type    = number
  default = null
}

variable "root_volume_throughput" {
  type    = number
  default = null
}

variable "root_volume_delete_on_termination" {
  type    = bool
  default = true
}

variable "root_volume_encrypted" {
  type    = bool
  default = false
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

variable "metadata_http_protocol_ipv6" {
  type    = string
  default = "disabled"
}

variable "metadata_instance_metadata_tags" {
  type    = string
  default = "disabled"
}

variable "tags" {
  type    = map(string)
  default = {}
}
