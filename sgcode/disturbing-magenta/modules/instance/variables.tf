# Variables for the instance module. Every value that can differ between
# EC2 instances is declared here and must be set by the root caller.

variable "ami" {
  description = "AMI ID for the instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (e.g. t2.medium)."
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair for SSH access."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID in which the instance resides."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs attached to the instance."
  type        = list(string)
}

variable "availability_zone" {
  description = "Availability zone of the instance."
  type        = string
}

variable "monitoring" {
  description = "Whether detailed monitoring is enabled."
  type        = bool
  default     = false
}

variable "ebs_optimized" {
  description = "Whether EBS optimisation is enabled."
  type        = bool
  default     = false
}

variable "source_dest_check" {
  description = "Whether source/destination checking is enabled."
  type        = bool
  default     = true
}

variable "tenancy" {
  description = "Tenancy of the instance (default, dedicated, host)."
  type        = string
  default     = "default"
}

variable "metadata_http_endpoint" {
  description = "IMDSv2 HTTP endpoint setting."
  type        = string
  default     = "enabled"
}

variable "metadata_http_put_response_hop_limit" {
  description = "IMDSv2 PUT response hop limit."
  type        = number
  default     = 1
}

variable "metadata_http_tokens" {
  description = "IMDSv2 token requirement (optional or required)."
  type        = string
  default     = "optional"
}

variable "metadata_instance_metadata_tags" {
  description = "Whether instance tags are exposed via IMDS."
  type        = string
  default     = "disabled"
}

variable "metadata_http_protocol_ipv6" {
  description = "Whether IPv6 endpoint for IMDS is enabled."
  type        = string
  default     = "disabled"
}

variable "root_delete_on_termination" {
  description = "Whether the root EBS volume is deleted on instance termination."
  type        = bool
  default     = true
}

variable "root_volume_type" {
  description = "Root volume type (gp2, gp3, io1, etc.)."
  type        = string
  default     = "gp2"
}

variable "root_volume_size" {
  description = "Root volume size in GiB."
  type        = number
}

variable "root_iops" {
  description = "Root volume provisioned IOPS (null for non-io types)."
  type        = number
  default     = null
}

variable "root_throughput" {
  description = "Root volume throughput in MiB/s (for gp3)."
  type        = number
  default     = null
}

variable "tags" {
  description = "Tags to assign to the instance."
  type        = map(string)
  default     = {}
}
