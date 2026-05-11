variable "region" {
  type        = string
  description = "AWS region where resources are managed"
}

variable "ami" {
  type        = string
  description = "AMI ID to use for the instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone to launch the instance in"
}

variable "key_name" {
  type        = string
  description = "Key pair name to use for the instance"
}

variable "subnet_id" {
  type        = string
  description = "VPC subnet ID to launch the instance in"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to associate with the instance"
}

variable "source_dest_check" {
  type        = bool
  description = "Whether to enable source/destination check on the instance"
}

variable "ebs_optimized" {
  type        = bool
  description = "Whether the instance is EBS optimized"
}

variable "monitoring" {
  type        = bool
  description = "Whether detailed monitoring is enabled"
}

variable "tenancy" {
  type        = string
  description = "Tenancy of the instance"
}

variable "capacity_reservation_preference" {
  type        = string
  description = "Capacity reservation preference for the instance"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Whether the metadata service HTTP endpoint is enabled"
}

variable "metadata_http_protocol_ipv6" {
  type        = string
  description = "Whether the IPv6 endpoint for instance metadata service is enabled"
}

variable "metadata_http_put_response_hop_limit" {
  type        = number
  description = "HTTP PUT response hop limit for instance metadata requests"
}

variable "metadata_http_tokens" {
  type        = string
  description = "Whether session tokens are required for metadata service (IMDSv2)"
}

variable "metadata_instance_metadata_tags" {
  type        = string
  description = "Whether access to instance tags from metadata service is enabled"
}

variable "enclave_options_enabled" {
  type        = bool
  description = "Whether Nitro Enclaves are enabled on the instance"
}

variable "root_block_device_delete_on_termination" {
  type        = bool
  description = "Whether the root block device is deleted on instance termination"
}

variable "user_data" {
  type        = string
  description = "User data to provide when launching the instance"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to assign to the instance"
}