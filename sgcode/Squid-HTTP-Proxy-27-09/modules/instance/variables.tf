variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
  default     = []
}

variable "source_dest_check" {
  description = "Source/dest check"
  type        = bool
  default     = true
}

variable "ebs_optimized" {
  description = "EBS optimized"
  type        = bool
  default     = false
}

variable "monitoring" {
  description = "Detailed monitoring"
  type        = bool
  default     = false
}

variable "tenancy" {
  description = "Tenancy"
  type        = string
  default     = "default"
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}

variable "root_block_device" {
  description = "Root block device config"
  type = object({
    volume_type           = optional(string)
    volume_size           = optional(number)
    delete_on_termination = optional(bool, true)
    encrypted             = optional(bool, false)
  })
  default = null
}

variable "metadata_options" {
  description = "Instance metadata options"
  type = object({
    http_endpoint               = optional(string, "enabled")
    http_tokens                 = optional(string, "optional")
    http_put_response_hop_limit = optional(number, 1)
    instance_metadata_tags      = optional(string, "disabled")
  })
  default = null
}
