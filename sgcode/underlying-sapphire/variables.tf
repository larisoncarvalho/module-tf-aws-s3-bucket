variable "region" {
  description = "AWS region"
  type        = string
}

variable "name" {
  description = "Name tag for VPC and related resources"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "instance_tenancy" {
  description = "Tenancy option for instances launched into the VPC"
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create in the VPC"
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  }))
}

variable "route_tables" {
  description = "Map of route tables to create"
  type = map(object({}))
}

variable "routes" {
  description = "Map of routes to create in route tables"
  type = map(object({
    route_table_key        = string
    destination_cidr_block = string
    gateway_id             = string
  }))
}

variable "route_table_associations" {
  description = "Map of route table to subnet associations"
  type = map(object({
    subnet_key      = string
    route_table_key = string
  }))
}

variable "main_route_table_key" {
  description = "Key of the route table to set as main route table"
  type        = string
}