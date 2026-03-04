variable "availability_zone" {
  description = "Availability zone for volumes"
  type        = string
  default     = "eu-central-1a"
}

variable "instance_id" {
  description = "Instance ID to attach volumes to"
  type        = string
}

variable "root_volume_size" {
  description = "Size of root volume in GB"
  type        = number
  default     = 50
}

variable "data_volume_size" {
  description = "Size of data volume in GB"
  type        = number
  default     = 100
}