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
  description = "Primary private IP address"
}

variable "private_ips" {
  type        = list(string)
  description = "Private IP addresses for network interface"
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

variable "hibernation_enabled" {
  type        = bool
  description = "Enable hibernation"
}

variable "enclave_enabled" {
  type        = bool
  description = "Enable enclave options"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Metadata service HTTP endpoint setting"
}

variable "metadata_http_tokens" {
  type        = string
  description = "Metadata service HTTP tokens requirement"
}

variable "metadata_hop_limit" {
  type        = number
  description = "Metadata service hop limit"
}

variable "metadata_http_protocol_ipv6" {
  type        = string
  description = "Metadata service IPv6 protocol setting"
}

variable "metadata_instance_tags" {
  type        = string
  description = "Metadata service instance tags setting"
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

variable "cpu_core_count" {
  type        = number
  description = "Number of CPU cores"
}

variable "cpu_threads_per_core" {
  type        = number
  description = "Number of threads per CPU core"
}

variable "key_name" {
  type        = string
  description = "Key pair name"
}

variable "public_key" {
  type        = string
  description = "Public key material for key pair"
}

variable "network_interface_device_index" {
  type        = number
  description = "Device index for network interface attachment"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}