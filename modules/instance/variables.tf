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

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP address"
}

variable "source_dest_check" {
  type        = bool
  description = "Whether to enable source/destination checking"
}

variable "ebs_optimized" {
  type        = bool
  description = "Whether the instance is EBS-optimized"
}

variable "monitoring" {
  type        = bool
  description = "Whether to enable detailed monitoring"
}

variable "tenancy" {
  type        = string
  description = "Instance tenancy"
}

variable "metadata_options" {
  type = object({
    http_endpoint               = string
    http_tokens                 = string
    http_put_response_hop_limit = number
    instance_metadata_tags      = string
  })
  description = "Metadata service configuration"
}