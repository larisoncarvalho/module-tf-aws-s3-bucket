variable "availability_zone" {
  type        = string
  description = "The AZ where the volume will exist"
}

variable "size" {
  type        = number
  description = "The size of the drive in GiBs"
}

variable "volume_type" {
  type        = string
  description = "The type of EBS volume"
  default     = "gp3"
}

variable "iops" {
  type        = number
  description = "The amount of IOPS to provision for the disk"
  default     = null
}

variable "throughput" {
  type        = number
  description = "The throughput that the volume supports, in MiB/s"
  default     = null
}

variable "encrypted" {
  type        = bool
  description = "If true, the disk will be encrypted"
  default     = false
}

variable "snapshot_id" {
  type        = string
  description = "A snapshot to base the EBS volume off of"
  default     = null
}

variable "multi_attach_enabled" {
  type        = bool
  description = "Specifies whether to enable Amazon EBS Multi-Attach"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the volume"
  default     = {}
}
