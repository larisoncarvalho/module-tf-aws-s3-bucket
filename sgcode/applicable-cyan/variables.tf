variable "region" {
  type        = string
  description = "AWS region"
}

variable "subnets" {
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    tags                    = map(string)
  }))
  description = "Map of subnets to create"
}

variable "route_tables" {
  type = map(object({
    tags = map(string)
  }))
  description = "Map of route tables to create"
}

variable "routes" {
  type = map(object({
    route_table_key            = string
    destination_cidr_block     = string
    gateway_id                 = string
    destination_prefix_list_id = string
  }))
  description = "Map of routes to create"
}

variable "route_table_associations" {
  type = map(object({
    route_table_key = string
    subnet_id       = string
  }))
  description = "Map of route table associations"
}

variable "dhcp_options_id" {
  type        = string
  description = "DHCP options ID"
}

variable "security_groups" {
  type = map(object({
    name        = string
    description = string
    tags        = map(string)
  }))
  description = "Map of security groups to create"
}

variable "ingress_rules" {
  type = map(object({
    security_group_key           = string
    from_port                    = number
    to_port                      = number
    ip_protocol                  = string
    cidr_ipv4                    = string
    referenced_security_group_id = string
    description                  = string
  }))
  description = "Map of ingress rules"
}

variable "egress_rules" {
  type = map(object({
    security_group_key = string
    from_port          = number
    to_port            = number
    ip_protocol        = string
    cidr_ipv4          = string
    description        = string
  }))
  description = "Map of egress rules"
}

variable "network_acl_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs to associate with the ACL"
}

variable "acl_rules" {
  type = map(object({
    rule_number = number
    egress      = bool
    protocol    = string
    rule_action = string
    cidr_block  = string
  }))
  description = "Map of ACL rules"
}

variable "vpc_endpoints" {
  type = map(object({
    service_name        = string
    vpc_endpoint_type   = string
    subnet_ids          = list(string)
    security_group_ids  = list(string)
    route_table_ids     = list(string)
    private_dns_enabled = bool
    policy              = string
  }))
  description = "Map of VPC endpoints to create"
}

variable "instances" {
  type = map(object({
    ami                    = string
    instance_type          = string
    subnet_id              = string
    vpc_security_group_ids = list(string)
    key_name               = string
    iam_instance_profile   = string
    monitoring             = bool
    source_dest_check      = bool
    user_data              = string
    metadata_options = object({
      http_endpoint               = string
      http_tokens                 = string
      http_put_response_hop_limit = number
    })
    root_block_device = object({
      volume_type           = string
      volume_size           = number
      delete_on_termination = bool
    })
    tags = map(string)
  }))
  description = "Map of instances to create"
}

variable "efs_file_system_id" {
  type        = string
  description = "EFS file system ID"
}

variable "efs_mount_targets" {
  type = map(object({
    subnet_id       = string
    security_groups = list(string)
    ip_address      = string
  }))
  description = "Map of mount targets to create"
}