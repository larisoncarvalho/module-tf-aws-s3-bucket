variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "encrypted" {
  description = "Whether volume is encrypted"
  type        = bool
}

variable "iops" {
  description = "IOPS for the volume"
  type        = number
}

variable "multi_attach_enabled" {
  description = "Whether multi-attach is enabled"
  type        = bool
}

variable "size" {
  description = "Volume size in GB"
  type        = number
}

variable "snapshot_id" {
  description = "Snapshot ID to create volume from"
  type        = string
}

variable "volume_type" {
  description = "Volume type"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}