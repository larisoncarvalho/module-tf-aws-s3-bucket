variable "region" {
  type        = string
  description = "AWS region for the resources"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the VPC"
}

variable "subnet_cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the subnet"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone for the subnet"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support in the VPC"
}

variable "default_network_acl_id" {
  type        = string
  description = "The ID of the default network ACL"
}

variable "network_acl_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to associate with the network ACL"
}