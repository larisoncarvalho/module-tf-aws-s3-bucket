variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}

variable "ebs_optimized" {
  description = "EBS optimized"
  type        = bool
}

variable "monitoring" {
  description = "Detailed monitoring"
  type        = bool
}

variable "source_dest_check" {
  description = "Source/destination check"
  type        = bool
}

variable "tenancy" {
  description = "Instance tenancy"
  type        = string
}

variable "network_interface_id" {
  description = "Network interface ID"
  type        = string
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

variable "metadata_http_put_response_hop_limit" {
  description = "Metadata HTTP PUT response hop limit"
  type        = number
}

variable "metadata_http_tokens" {
  description = "Metadata HTTP tokens"
  type        = string
}

variable "metadata_instance_metadata_tags" {
  description = "Instance metadata tags"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}