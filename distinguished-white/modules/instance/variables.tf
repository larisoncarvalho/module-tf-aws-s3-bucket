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
  description = "Availability zone for instance placement"
}

variable "subnet_id" {
  type        = string
  description = "VPC subnet ID for instance network interface"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs to attach to instance"
}

variable "iam_instance_profile_arn" {
  type        = string
  description = "IAM instance profile ARN"
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name for SSH access"
}

variable "ebs_optimized" {
  type        = bool
  description = "Enable EBS optimization"
}

variable "monitoring_enabled" {
  type        = bool
  description = "Enable detailed monitoring"
}

variable "source_dest_check" {
  type        = bool
  description = "Enable source/destination checking"
}

variable "tenancy" {
  type        = string
  description = "Instance tenancy"
}

variable "hibernation_enabled" {
  type        = bool
  description = "Enable hibernation support"
}

variable "enclave_enabled" {
  type        = bool
  description = "Enable Nitro Enclaves"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Instance metadata HTTP endpoint state"
}

variable "metadata_http_tokens" {
  type        = string
  description = "Instance metadata HTTP tokens requirement"
}

variable "metadata_hop_limit" {
  type        = number
  description = "Instance metadata HTTP PUT response hop limit"
}

variable "metadata_http_protocol_ipv6" {
  type        = string
  description = "Instance metadata IPv6 endpoint state"
}

variable "metadata_instance_tags" {
  type        = string
  description = "Instance metadata tags access state"
}

variable "capacity_reservation_preference" {
  type        = string
  description = "Capacity reservation preference"
}

variable "root_delete_on_termination" {
  type        = bool
  description = "Delete root volume on instance termination"
}

variable "cpu_core_count" {
  type        = number
  description = "Number of CPU cores"
}

variable "cpu_threads_per_core" {
  type        = number
  description = "Number of threads per CPU core"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}