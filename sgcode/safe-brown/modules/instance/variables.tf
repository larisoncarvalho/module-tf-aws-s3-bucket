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
  description = "Subnet ID where instance will be launched"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the instance"
}

variable "ebs_optimized" {
  type        = bool
  description = "Whether EBS optimization is enabled"
}

variable "monitoring_enabled" {
  type        = bool
  description = "Whether detailed monitoring is enabled"
}

variable "source_dest_check" {
  type        = bool
  description = "Whether source/destination checking is enabled"
}

variable "tenancy" {
  type        = string
  description = "Tenancy of the instance"
}

variable "private_ip_address" {
  type        = string
  description = "Private IP address for the instance"
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
  description = "Desired HTTP PUT response hop limit"
}

variable "metadata_http_protocol_ipv6" {
  type        = string
  description = "Whether IPv6 is enabled for metadata service"
}

variable "metadata_instance_metadata_tags" {
  type        = string
  description = "Whether instance tags are available via metadata"
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type"
}

variable "root_delete_on_termination" {
  type        = bool
  description = "Whether root volume is deleted on termination"
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
  description = "Tags to apply to the instance"
}