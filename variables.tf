variable "region" {
  type        = string
  description = "AWS region"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for instance placement"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs for the instance"
}

variable "key_pair_public_key" {
  type        = string
  description = "Public key material for SSH key pair"
}