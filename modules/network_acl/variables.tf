variable "vpc_id" {
  type        = string
  description = "The VPC ID to associate the Network ACL with"
}

variable "default_network_acl_id" {
  type        = string
  description = "The ID of the default network ACL to manage"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to apply the ACL to"
  default     = []
}