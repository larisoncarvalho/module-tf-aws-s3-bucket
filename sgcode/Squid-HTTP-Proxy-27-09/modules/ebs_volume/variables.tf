variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "size" {
  description = "Volume size in GiB"
  type        = number
}

variable "type" {
  description = "Volume type"
  type        = string
  default     = "gp2"
}

variable "iops" {
  description = "IOPS for the volume"
  type        = number
  default     = null
}

variable "throughput" {
  description = "Throughput for gp3 volumes"
  type        = number
  default     = null
}

variable "encrypted" {
  description = "Whether volume is encrypted"
  type        = bool
  default     = false
}

variable "snapshot_id" {
  description = "Snapshot ID to create volume from"
  type        = string
  default     = null
}

variable "multi_attach_enabled" {
  description = "Whether multi-attach is enabled"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
