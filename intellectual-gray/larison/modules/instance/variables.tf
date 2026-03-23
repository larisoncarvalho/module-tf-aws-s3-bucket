variable "ami_id" {
  type        = string
  description = "AMI ID for the instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "SSH key pair name"
}

variable "subnet_id" {
  type        = string
  description = "VPC subnet ID for instance placement"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs to attach to instance"
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
  description = "Number of threads per CPU core"
}

variable "hibernation_enabled" {
  type        = bool
  description = "Enable hibernation"
}

variable "enclave_enabled" {
  type        = bool
  description = "Enable AWS Nitro Enclaves"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Enable or disable metadata service HTTP endpoint"
}

variable "metadata_http_tokens" {
  type        = string
  description = "Metadata service authentication method"
}

variable "metadata_hop_limit" {
  type        = number
  description = "Metadata service HTTP PUT response hop limit"
}

variable "metadata_http_protocol_ipv6" {
  type        = string
  description = "Enable or disable IPv6 for metadata service"
}

variable "metadata_instance_tags" {
  type        = string
  description = "Enable or disable instance tags in metadata"
}

variable "capacity_reservation_preference" {
  type        = string
  description = "Capacity reservation preference"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}