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
  description = "Key pair name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone"
}

variable "associate_public_ip_address" {
  type        = bool
  default     = false
  description = "Whether to associate a public IP"
}

variable "source_dest_check" {
  type        = bool
  default     = true
  description = "Source/dest check"
}

variable "ebs_optimized" {
  type        = bool
  default     = false
  description = "EBS optimized"
}

variable "monitoring" {
  type        = bool
  default     = false
  description = "Detailed monitoring"
}

variable "root_block_device" {
  type = object({
    volume_type           = optional(string, "gp2")
    volume_size           = optional(number, 8)
    delete_on_termination = optional(bool, true)
    encrypted             = optional(bool, false)
  })
  default     = {}
  description = "Root block device configuration"
}

variable "metadata_options" {
  type = object({
    http_endpoint               = optional(string, "enabled")
    http_tokens                 = optional(string, "optional")
    http_put_response_hop_limit = optional(number, 1)
    instance_metadata_tags      = optional(string, "disabled")
  })
  default     = {}
  description = "Instance metadata options"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the instance"
}
