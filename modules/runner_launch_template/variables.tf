variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
}

variable "user_data" {
  description = "User data script (base64 encoded)"
  type        = string
}

variable "instance_name_tag" {
  description = "Name tag for instances"
  type        = string
}