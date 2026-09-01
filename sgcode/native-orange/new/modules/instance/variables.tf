variable "ami" {
  type        = string
  description = "AMI ID to use for the instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the instance"
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH access"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where instance will be launched"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security group IDs to attach"
}

variable "private_ip" {
  type        = string
  description = "Private IP address"
}

variable "source_dest_check" {
  type        = bool
  description = "Whether to enable source/destination checking"
}

variable "ebs_optimized" {
  type        = bool
  description = "Whether to enable EBS optimization"
}

variable "monitoring" {
  type        = bool
  description = "Whether to enable detailed monitoring"
}

variable "tenancy" {
  type        = string
  description = "Tenancy of the instance"
}

variable "cpu_core_count" {
  type        = number
  description = "Number of CPU cores"
}

variable "cpu_threads_per_core" {
  type        = number
  description = "Number of threads per CPU core"
}

variable "hibernation" {
  type        = bool
  description = "Whether hibernation is enabled"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Whether the metadata service is available"
}

variable "metadata_http_tokens" {
  type        = string
  description = "Whether session tokens are required for metadata requests"
}

variable "metadata_http_put_response_hop_limit" {
  type        = number
  description = "Desired HTTP PUT response hop limit for instance metadata requests"
}

variable "metadata_http_protocol_ipv6" {
  type        = string
  description = "Whether IPv6 is enabled for the metadata service"
}

variable "metadata_instance_metadata_tags" {
  type        = string
  description = "Whether instance tags are available through metadata"
}

variable "enclave_enabled" {
  type        = bool
  description = "Whether Nitro Enclaves are enabled"
}

variable "capacity_reservation_preference" {
  type        = string
  description = "Capacity reservation preference"
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type"
}

variable "root_volume_size" {
  type        = number
  description = "Root volume size in GB"
}

variable "root_volume_iops" {
  type        = number
  description = "Root volume IOPS"
}

variable "root_volume_throughput" {
  type        = number
  description = "Root volume throughput in MB/s"
}

variable "root_volume_encrypted" {
  type        = bool
  description = "Whether root volume is encrypted"
}

variable "root_volume_delete_on_termination" {
  type        = bool
  description = "Whether root volume is deleted on instance termination"
}