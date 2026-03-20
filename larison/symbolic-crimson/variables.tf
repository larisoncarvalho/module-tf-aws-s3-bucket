variable "region" {
  type        = string
  description = "AWS region for the resources"
  default     = "eu-central-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone for the subnet"
  default     = "eu-central-1b"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support in the VPC"
  default     = true
}

variable "default_network_acl_id" {
  type        = string
  description = "The ID of the default network ACL"
  default     = null
}

variable "network_acl_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to associate with the network ACL"
  default     = []
}