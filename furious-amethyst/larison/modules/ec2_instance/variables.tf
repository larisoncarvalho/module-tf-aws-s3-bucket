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
  description = "VPC subnet ID"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "private_ip" {
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

variable "monitoring" {
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

variable "hibernation" {
  type        = bool
  description = "Enable hibernation"
}

variable "enclave_enabled" {
  type        = bool
  description = "Enable AWS Nitro Enclaves"
}

variable "capacity_reservation_preference" {
  type        = string
  description = "Capacity reservation preference"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Metadata service HTTP endpoint state"
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
  description = "Metadata service IPv6 endpoint state"
}

variable "metadata_instance_tags" {
  type        = string
  description = "Metadata service instance tags access"
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type"
}

variable "root_delete_on_termination" {
  type        = bool
  description = "Delete root volume on instance termination"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}