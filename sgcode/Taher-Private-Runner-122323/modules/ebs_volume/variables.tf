variable "availability_zone" {
  type        = string
  description = "Availability zone"
}

variable "size" {
  type        = number
  description = "Volume size in GiB"
}

variable "type" {
  type        = string
  default     = "gp2"
  description = "Volume type"
}

variable "iops" {
  type        = number
  default     = null
  description = "IOPS for the volume"
}

variable "throughput" {
  type        = number
  default     = null
  description = "Throughput in MiB/s"
}

variable "encrypted" {
  type        = bool
  default     = false
  description = "Whether the volume is encrypted"
}

variable "snapshot_id" {
  type        = string
  default     = null
  description = "Snapshot ID to create volume from"
}

variable "multi_attach_enabled" {
  type        = bool
  default     = false
  description = "Multi-attach enabled"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags"
}
