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

variable "subnet_id" {
  type        = string
  description = "Subnet identifier"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security group IDs"
}

variable "source_dest_check" {
  type        = bool
  description = "Whether source/destination checking is enabled"
}

variable "ebs_optimized" {
  type        = bool
  description = "Whether EBS optimization is enabled"
}

variable "monitoring" {
  type        = bool
  description = "Whether detailed monitoring is enabled"
}

variable "ebs_volume_size" {
  type        = number
  description = "EBS volume size in GB"
}

variable "ebs_volume_type" {
  type        = string
  description = "EBS volume type"
}

variable "ebs_volume_iops" {
  type        = number
  description = "EBS volume IOPS"
}

variable "ebs_snapshot_id" {
  type        = string
  description = "Snapshot ID to create volume from"
}

variable "ebs_encrypted" {
  type        = bool
  description = "Whether EBS volume is encrypted"
}

variable "ebs_device_name" {
  type        = string
  description = "Device name for EBS volume attachment"
}