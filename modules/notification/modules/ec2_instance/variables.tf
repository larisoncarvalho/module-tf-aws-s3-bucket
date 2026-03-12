variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for instance placement"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "subnet_id" {
  description = "Subnet ID for instance placement"
  type        = string
}

variable "source_dest_check" {
  description = "Enable source/destination checking"
  type        = bool
  default     = true
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

variable "metadata_options" {
  description = "Instance metadata service configuration"
  type = object({
    http_endpoint               = string
    http_tokens                 = string
    http_put_response_hop_limit = number
    http_protocol_ipv6          = string
    instance_metadata_tags      = string
  })
}

variable "enclave_options_enabled" {
  description = "Enable AWS Nitro Enclaves"
  type        = bool
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}