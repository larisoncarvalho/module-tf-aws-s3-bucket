variable "region" {
  description = "AWS region"
  type        = string
}

variable "key_pair_key_name" {
  description = "The name for the key pair"
  type        = string
}

variable "key_pair_public_key" {
  description = "The public key material for the key pair"
  type        = string
  sensitive   = true
}

variable "network_interface_subnet_id" {
  description = "Subnet ID to create the ENI in"
  type        = string
}

variable "network_interface_private_ip_address" {
  description = "Primary private IP address to assign to the ENI"
  type        = string
}

variable "network_interface_security_group_id" {
  description = "Security group ID to assign to the ENI"
  type        = string
}

variable "network_interface_source_dest_check" {
  description = "Whether to enable source destination checking for the ENI"
  type        = bool
}

variable "instance_ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "instance_instance_type" {
  description = "Instance type to use for the instance"
  type        = string
}

variable "instance_availability_zone" {
  description = "Availability zone to start the instance in"
  type        = string
}

variable "instance_tenancy" {
  description = "Tenancy of the instance"
  type        = string
}

variable "instance_ebs_optimized" {
  description = "Whether the launched EC2 instance will be EBS-optimized"
  type        = bool
}

variable "instance_source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance"
  type        = bool
}

variable "instance_monitoring" {
  description = "Whether the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
}

variable "instance_security_group_id" {
  description = "Security group ID to associate with the instance"
  type        = string
}

variable "instance_subnet_id" {
  description = "VPC Subnet ID to launch in"
  type        = string
}

variable "instance_private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
}

variable "instance_capacity_reservation_preference" {
  description = "Indicates the instance's Capacity Reservation preferences"
  type        = string
}

variable "instance_metadata_http_endpoint" {
  description = "Whether the metadata service is available"
  type        = string
}

variable "instance_metadata_http_protocol_ipv6" {
  description = "Whether the IPv6 endpoint for the instance metadata service is enabled"
  type        = string
}

variable "instance_metadata_http_put_response_hop_limit" {
  description = "Desired HTTP PUT response hop limit for instance metadata requests"
  type        = number
}

variable "instance_metadata_http_tokens" {
  description = "Whether or not the metadata service requires session tokens"
  type        = string
}

variable "instance_metadata_instance_metadata_tags" {
  description = "Enables or disables access to instance tags from the instance metadata service"
  type        = string
}

variable "instance_enclave_options_enabled" {
  description = "Whether Nitro Enclaves will be enabled on the instance"
  type        = bool
}

variable "instance_root_block_device_delete_on_termination" {
  description = "Whether the root volume should be destroyed on instance termination"
  type        = bool
}

variable "instance_name_tag" {
  description = "Name tag for the instance"
  type        = string
}