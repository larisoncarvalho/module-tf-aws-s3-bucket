variable "ami_id" {
  type        = string
  description = "AMI ID for the instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the instance"
}

variable "key_name" {
  type        = string
  description = "SSH key pair name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the instance"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs"
}

variable "private_ip_address" {
  type        = string
  description = "Private IP address"
}

variable "source_dest_check" {
  type        = bool
  description = "Enable source/destination checking"
}

variable "ebs_optimized" {
  type        = bool
  description = "Enable EBS optimization"
}

variable "monitoring_enabled" {
  type        = bool
  description = "Enable detailed monitoring"
}

variable "tenancy" {
  type        = string
  description = "Instance tenancy"
}

variable "cpu_core_count" {
  type        = number
  description = "Number of CPU cores"
}

variable "cpu_threads_per_core" {
  type        = number
  description = "Threads per CPU core"
}

variable "hibernation_enabled" {
  type        = bool
  description = "Enable hibernation"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Metadata service HTTP endpoint"
}

variable "metadata_http_tokens" {
  type        = string
  description = "Metadata service HTTP tokens requirement"
}

variable "metadata_http_put_response_hop_limit" {
  type        = number
  description = "Metadata service HTTP PUT response hop limit"
}

variable "metadata_http_protocol_ipv6" {
  type        = string
  description = "Metadata service IPv6 protocol"
}

variable "metadata_instance_metadata_tags" {
  type        = string
  description = "Enable instance metadata tags"
}

variable "enclave_enabled" {
  type        = bool
  description = "Enable Nitro Enclaves"
}

variable "capacity_reservation_preference" {
  type        = string
  description = "Capacity reservation preference"
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type"
}

variable "root_delete_on_termination" {
  type        = bool
  description = "Delete root volume on termination"
}

variable "instance_tags" {
  type        = map(string)
  description = "Tags for the instance"
}

variable "network_interface_private_ips" {
  type        = list(string)
  description = "Private IP addresses for network interface"
}

variable "network_interface_device_index" {
  type        = number
  description = "Device index for network interface attachment"
}