variable "ami" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for instance placement"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for instance network interface"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Security group IDs to attach to the instance"
  type        = list(string)
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address"
  type        = bool
}

variable "source_dest_check" {
  description = "Controls source/destination checking"
  type        = bool
}

variable "ebs_optimized" {
  description = "Whether the instance is EBS optimized"
  type        = bool
}

variable "monitoring" {
  description = "Enable detailed monitoring"
  type        = bool
}

variable "tenancy" {
  description = "Instance tenancy"
  type        = string
}

variable "hibernation" {
  description = "Enable hibernation support"
  type        = bool
}

variable "enclave_enabled" {
  description = "Enable Nitro Enclaves"
  type        = bool
}

variable "metadata_http_endpoint" {
  description = "Metadata service HTTP endpoint state"
  type        = string
}

variable "metadata_http_tokens" {
  description = "Metadata service HTTP tokens requirement"
  type        = string
}

variable "metadata_http_put_response_hop_limit" {
  description = "Metadata service HTTP PUT response hop limit"
  type        = number
}

variable "metadata_instance_metadata_tags" {
  description = "Enable instance metadata tags"
  type        = string
}

variable "capacity_reservation_preference" {
  description = "Capacity reservation preference"
  type        = string
}

variable "root_volume_type" {
  description = "Root volume type"
  type        = string
}

variable "root_delete_on_termination" {
  description = "Delete root volume on instance termination"
  type        = bool
}

variable "cpu_core_count" {
  description = "Number of CPU cores"
  type        = number
}

variable "cpu_threads_per_core" {
  description = "Number of threads per CPU core"
  type        = number
}