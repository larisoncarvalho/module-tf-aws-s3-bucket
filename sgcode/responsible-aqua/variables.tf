variable "region" {
  type        = string
  description = "AWS region to deploy resources"
}

variable "key_pair_key_name" {
  type        = string
  description = "Name of the EC2 key pair"
}

variable "key_pair_public_key" {
  type        = string
  description = "Public key material for the taher-private-runner key pair; value not available in discovery data and MUST be supplied in sg.tfvars before applying"
}

variable "instance_ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "instance_tenancy" {
  type        = string
  description = "Instance tenancy setting"
}

variable "instance_ebs_optimized" {
  type        = bool
  description = "Whether the instance is EBS-optimized"
}

variable "instance_monitoring" {
  type        = bool
  description = "Whether detailed CloudWatch monitoring is enabled"
}

variable "instance_hibernation" {
  type        = bool
  description = "Whether hibernation is enabled for the instance"
}

variable "instance_cpu_core_count" {
  type        = number
  description = "Number of CPU cores for the instance"
}

variable "instance_cpu_threads_per_core" {
  type        = number
  description = "Number of threads per CPU core"
}

variable "instance_metadata_http_endpoint" {
  type        = string
  description = "Whether the instance metadata service HTTP endpoint is enabled"
}

variable "instance_metadata_http_tokens" {
  type        = string
  description = "IMDSv2 token requirement for the metadata service"
}

variable "instance_metadata_http_put_response_hop_limit" {
  type        = number
  description = "HTTP PUT response hop limit for instance metadata requests"
}

variable "instance_enclave_options_enabled" {
  type        = bool
  description = "Whether AWS Nitro Enclaves are enabled on the instance"
}

variable "instance_capacity_reservation_preference" {
  type        = string
  description = "Capacity reservation preference for the instance"
}

variable "instance_root_block_device_delete_on_termination" {
  type        = bool
  description = "Whether to delete the root EBS volume when the instance is terminated"
}

variable "instance_subnet_id" {
  type        = string
  description = "Subnet ID for the network interface"
}

variable "instance_private_ip_address" {
  type        = string
  description = "Primary private IP address assigned to the network interface"
}

variable "instance_security_group_ids" {
  type        = list(string)
  description = "Security group IDs to attach to the network interface"
}

variable "instance_source_dest_check" {
  type        = bool
  description = "Whether source/destination checking is enabled on the network interface"
}

variable "instance_instance_name_tag" {
  type        = string
  description = "Value for the Name tag on the EC2 instance"
}