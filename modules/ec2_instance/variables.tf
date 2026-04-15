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
  description = "Key pair name for SSH access"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "source_dest_check" {
  description = "Enable source/destination checking"
  type        = bool
}

variable "ebs_optimized" {
  description = "Enable EBS optimization"
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
  description = "Enable hibernation"
  type        = bool
}

variable "enclave_enabled" {
  description = "Enable enclave options"
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

variable "root_delete_on_termination" {
  description = "Delete root volume on instance termination"
  type        = bool
}