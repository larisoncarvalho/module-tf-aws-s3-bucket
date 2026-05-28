variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "vpc_name" {
  description = "Name to be used on all VPC resources as identifier"
  type        = string
}

variable "vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
}

variable "vpc_instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
  type        = bool
}

variable "create_igw" {
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them"
  type        = bool
}

variable "create_egress_only_igw" {
  description = "Controls if an Egress Only Internet Gateway is created and its related routes"
  type        = bool
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
}

variable "manage_default_security_group" {
  description = "Should be true to adopt and manage default security group"
  type        = bool
}

variable "manage_default_network_acl" {
  description = "Should be true to adopt and manage Default Network ACL"
  type        = bool
}

variable "manage_default_route_table" {
  description = "Should be true to manage default route table"
  type        = bool
}

variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
}