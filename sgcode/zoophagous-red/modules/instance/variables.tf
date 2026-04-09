variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "public_key" {
  description = "Public key material for the key pair"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
}

variable "private_ip_address" {
  description = "Private IP address"
  type        = string
}

variable "source_dest_check" {
  description = "Source destination check"
  type        = bool
}

variable "ebs_optimized" {
  description = "EBS optimized flag"
  type        = bool
}

variable "monitoring_enabled" {
  description = "Monitoring enabled flag"
  type        = bool
}

variable "tenancy" {
  description = "Instance tenancy"
  type        = string
}

variable "cpu_core_count" {
  description = "CPU core count"
  type        = number
}

variable "cpu_threads_per_core" {
  description = "CPU threads per core"
  type        = number
}

variable "root_volume_type" {
  description = "Root volume type"
  type        = string
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  type        = number
}

variable "root_delete_on_termination" {
  description = "Delete root volume on termination"
  type        = bool
}

variable "metadata_http_endpoint" {
  description = "Metadata HTTP endpoint"
  type        = string
}

variable "metadata_http_tokens" {
  description = "Metadata HTTP tokens"
  type        = string
}

variable "metadata_http_put_response_hop_limit" {
  description = "Metadata HTTP put response hop limit"
  type        = number
}

variable "metadata_http_protocol_ipv6" {
  description = "Metadata HTTP protocol IPv6"
  type        = string
}

variable "metadata_instance_metadata_tags" {
  description = "Metadata instance metadata tags"
  type        = string
}

variable "enclave_enabled" {
  description = "Enclave enabled flag"
  type        = bool
}

variable "capacity_reservation_preference" {
  description = "Capacity reservation preference"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}