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
  description = "Subnet ID where instance will be launched"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "iam_instance_profile_arn" {
  type        = string
  description = "IAM instance profile ARN"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP address"
}

variable "source_dest_check" {
  type        = bool
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance"
}

variable "ebs_optimized" {
  type        = bool
  description = "Whether the instance is EBS optimized"
}

variable "monitoring" {
  type        = bool
  description = "Whether to enable detailed monitoring"
}

variable "tenancy" {
  type        = string
  description = "Tenancy of the instance"
}

variable "hibernation" {
  type        = bool
  description = "Whether hibernation is configured"
}

variable "enclave_enabled" {
  type        = bool
  description = "Whether Nitro Enclaves are enabled"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Whether the metadata service is available"
}

variable "metadata_http_tokens" {
  type        = string
  description = "Whether IMDSv2 is required"
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
  description = "Whether instance tags are available through metadata service"
}

variable "root_volume_type" {
  type        = string
  description = "Type of root volume"
}

variable "root_delete_on_termination" {
  type        = bool
  description = "Whether root volume should be deleted on instance termination"
}

variable "cpu_core_count" {
  type        = number
  description = "Number of CPU cores"
}

variable "cpu_threads_per_core" {
  type        = number
  description = "Number of threads per CPU core"
}

variable "capacity_reservation_preference" {
  type        = string
  description = "Capacity reservation preference"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the instance"
}