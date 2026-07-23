variable "ami_id" {
  type        = string
  description = "AMI ID for the instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone"
}

variable "key_name" {
  type        = string
  description = "SSH key pair name"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
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

variable "root_volume_type" {
  type        = string
  description = "Root volume type"
}

variable "root_volume_size" {
  type        = number
  description = "Root volume size in GB"
}

variable "root_delete_on_termination" {
  type        = bool
  description = "Whether to delete root volume on termination"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Metadata service HTTP endpoint setting"
}

variable "metadata_http_tokens" {
  type        = string
  description = "Metadata service HTTP tokens setting"
}

variable "metadata_hop_limit" {
  type        = number
  description = "Metadata service hop limit"
}