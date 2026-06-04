# Variables stand ready
# each holds a shape of the world—
# cloud waits to take form

variable "region" {
  type        = string
  description = "AWS region to deploy resources in"
}

variable "instance_ami" {
  type        = string
  description = "AMI ID to use for the EC2 instance"
}

variable "instance_instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "instance_availability_zone" {
  type        = string
  description = "Availability zone for the EC2 instance"
}

variable "instance_subnet_id" {
  type        = string
  description = "Subnet ID to launch the EC2 instance in"
}

variable "instance_vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to associate with the EC2 instance"
}

variable "instance_source_dest_check" {
  type        = bool
  description = "Whether to enable source/destination check on the EC2 instance"
}

variable "instance_ebs_optimized" {
  type        = bool
  description = "Whether the EC2 instance is EBS optimized"
}

variable "instance_monitoring" {
  type        = bool
  description = "Whether detailed monitoring is enabled on the EC2 instance"
}

variable "instance_tenancy" {
  type        = string
  description = "Tenancy of the EC2 instance"
}

variable "instance_tags" {
  type        = map(string)
  description = "Tags to assign to the EC2 instance"
}

variable "instance_metadata_http_endpoint" {
  type        = string
  description = "Whether the metadata service is available"
}

variable "instance_metadata_http_protocol_ipv6" {
  type        = string
  description = "Whether the IPv6 endpoint for IMDS is enabled"
}

variable "instance_metadata_http_put_response_hop_limit" {
  type        = number
  description = "HTTP PUT response hop limit for instance metadata requests"
}

variable "instance_metadata_http_tokens" {
  type        = string
  description = "Whether IMDSv2 is required"
}

variable "instance_metadata_instance_metadata_tags" {
  type        = string
  description = "Whether instance tags are accessible from instance metadata"
}

variable "instance_capacity_reservation_preference" {
  type        = string
  description = "Capacity reservation preference for the EC2 instance"
}

variable "instance_enclave_options_enabled" {
  type        = bool
  description = "Whether Nitro Enclaves are enabled on the EC2 instance"
}

variable "instance_root_block_device_delete_on_termination" {
  type        = bool
  description = "Whether the root volume should be deleted on instance termination"
}

variable "ebs_volume_availability_zone" {
  type        = string
  description = "Availability zone where the EBS volume exists"
}

variable "ebs_volume_size" {
  type        = number
  description = "Size of the EBS volume in GiB"
}

variable "ebs_volume_type" {
  type        = string
  description = "Type of EBS volume"
}

variable "ebs_volume_iops" {
  type        = number
  description = "Amount of IOPS provisioned for the EBS volume"
}

variable "ebs_volume_throughput" {
  type        = number
  description = "Throughput in MiB/s for the EBS volume"
}

variable "ebs_volume_encrypted" {
  type        = bool
  description = "Whether the EBS volume is encrypted"
}

variable "ebs_volume_multi_attach_enabled" {
  type        = bool
  description = "Whether multi-attach is enabled on the EBS volume"
}

variable "ebs_volume_snapshot_id" {
  type        = string
  description = "Snapshot ID the EBS volume was created from"
}

variable "key_pair_key_name" {
  type        = string
  description = "Name of the key pair"
}

variable "key_pair_public_key" {
  type        = string
  description = "Public key material for the key pair"
  sensitive   = true
}

variable "network_interface_subnet_id" {
  type        = string
  description = "Subnet ID for the network interface"
}

variable "network_interface_private_ips" {
  type        = list(string)
  description = "Private IP addresses assigned to the network interface"
}

variable "network_interface_security_groups" {
  type        = list(string)
  description = "Security group IDs assigned to the network interface"
}

variable "network_interface_source_dest_check" {
  type        = bool
  description = "Whether source/destination check is enabled on the network interface"
}