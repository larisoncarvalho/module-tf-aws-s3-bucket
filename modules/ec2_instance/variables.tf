variable "ami" {
  type        = string
  description = "AMI ID for the instance"
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
  description = "SSH key pair name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the instance"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security group IDs attached to the instance"
}

variable "ebs_optimized" {
  type        = bool
  description = "Whether EBS optimization is enabled"
}

variable "monitoring" {
  type        = bool
  description = "Whether detailed monitoring is enabled"
}

variable "source_dest_check" {
  type        = bool
  description = "Whether source/destination checking is enabled"
}

variable "tenancy" {
  type        = string
  description = "Instance tenancy"
}

variable "metadata_options" {
  type = object({
    http_endpoint               = string
    http_protocol_ipv6          = string
    http_put_response_hop_limit = number
    http_tokens                 = string
    instance_metadata_tags      = string
  })
  description = "Instance metadata service configuration"
}

variable "enclave_options_enabled" {
  type        = bool
  description = "Whether AWS Nitro Enclaves are enabled"
}

variable "cpu_core_count" {
  type        = number
  description = "Number of CPU cores"
}

variable "cpu_threads_per_core" {
  type        = number
  description = "Number of threads per CPU core"
}