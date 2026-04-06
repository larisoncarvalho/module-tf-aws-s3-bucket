variable "region" {
  type        = string
  description = "AWS region"
}

variable "taher_private_runner_public_key" {
  type        = string
  description = "Public key material for taher-private-runner key pair"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the instance"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs"
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type"
}