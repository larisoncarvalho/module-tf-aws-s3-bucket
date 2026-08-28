variable "ami" {
  type        = string
  description = "AMI to use for the instance"
}

variable "instance_type" {
  type        = string
  description = "The instance type to use"
}

variable "subnet_id" {
  type        = string
  description = "The VPC Subnet ID to launch in"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to associate with"
  default     = []
}

variable "key_name" {
  type        = string
  description = "Key name of the Key Pair to use for the instance"
  default     = null
}

variable "availability_zone" {
  type        = string
  description = "AZ to start the instance in"
  default     = null
}

variable "tenancy" {
  type        = string
  description = "The tenancy of the instance"
  default     = "default"
}

variable "ebs_optimized" {
  type        = bool
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "source_dest_check" {
  type        = bool
  description = "Controls if traffic is routed to the instance when destination address does not match the instance"
  default     = true
}

variable "monitoring" {
  type        = bool
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "get_password_data" {
  type        = bool
  description = "If true, wait for password data to become available and retrieve it"
  default     = false
}

variable "hibernation" {
  type        = bool
  description = "If true, the launched EC2 instance will support hibernation"
  default     = false
}

variable "user_data" {
  type        = string
  description = "The user data to provide when launching the instance"
  default     = null
}

variable "root_block_device" {
  type = object({
    volume_type           = optional(string)
    volume_size           = optional(number)
    iops                  = optional(number)
    throughput            = optional(number)
    delete_on_termination = optional(bool, true)
    encrypted             = optional(bool, false)
  })
  description = "Root block device configuration"
  default     = null
}

variable "metadata_options" {
  type = object({
    http_endpoint               = optional(string, "enabled")
    http_tokens                 = optional(string, "optional")
    http_put_response_hop_limit = optional(number, 1)
    instance_metadata_tags      = optional(string, "disabled")
  })
  description = "Metadata options for the instance"
  default     = null
}

variable "cpu_options" {
  type = object({
    core_count       = optional(number)
    threads_per_core = optional(number)
  })
  description = "CPU options for the instance"
  default     = null
}

variable "enclave_options_enabled" {
  type        = bool
  description = "Enable Nitro Enclaves on launched instances"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the instance"
  default     = {}
}
