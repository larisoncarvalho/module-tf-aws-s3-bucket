variable "default_network_acl_id" {
  type        = string
  description = "The ID of the default network ACL"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to associate with the network ACL"
}