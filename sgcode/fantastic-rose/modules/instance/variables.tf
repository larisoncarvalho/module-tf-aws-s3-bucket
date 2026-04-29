variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type to use for the instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name to use for the instance"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone to start the instance in"
  type        = string
}

variable "tenancy" {
  description = "Tenancy of the instance"
  type        = string
}

variable "ebs_optimized" {
  description = "Whether the launched EC2 instance will be EBS-optimized"
  type        = bool
}

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance"
  type        = bool
}

variable "monitoring" {
  description = "Whether the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
}

variable "security_group_id" {
  description = "Security group ID to associate with the instance"
  type        = string
}

variable "subnet_id" {
  description = "VPC Subnet ID to launch in"
  type        = string
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
}

variable "capacity_reservation_preference" {
  description = "Indicates the instance's Capacity Reservation preferences"
  type        = string
}

variable "metadata_http_endpoint" {
  description = "Whether the metadata service is available"
  type        = string
}

variable "metadata_http_protocol_ipv6" {
  description = "Whether the IPv6 endpoint for the instance metadata service is enabled"
  type        = string
}

variable "metadata_http_put_response_hop_limit" {
  description = "Desired HTTP PUT response hop limit for instance metadata requests"
  type        = number
}

variable "metadata_http_tokens" {
  description = "Whether or not the metadata service requires session tokens"
  type        = string
}

variable "metadata_instance_metadata_tags" {
  description = "Enables or disables access to instance tags from the instance metadata service"
  type        = string
}

variable "enclave_options_enabled" {
  description = "Whether Nitro Enclaves will be enabled on the instance"
  type        = bool
}

variable "root_block_device_delete_on_termination" {
  description = "Whether the root volume should be destroyed on instance termination"
  type        = bool
}

variable "name_tag" {
  description = "Name tag for the instance"
  type        = string
}