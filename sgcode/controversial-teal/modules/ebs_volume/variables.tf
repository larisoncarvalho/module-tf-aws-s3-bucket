# Inputs shape the disk
# size, type, zone declared here—
# volume takes its form

variable "availability_zone" {
  type        = string
  description = "Availability zone where the EBS volume exists"
}

variable "size" {
  type        = number
  description = "Size of the EBS volume in GiB"
}

variable "type" {
  type        = string
  description = "Type of EBS volume"
}

variable "iops" {
  type        = number
  description = "Amount of IOPS provisioned for the volume"
}

variable "throughput" {
  type        = number
  description = "Throughput in MiB/s for the volume"
}

variable "encrypted" {
  type        = bool
  description = "Whether the volume is encrypted"
}

variable "multi_attach_enabled" {
  type        = bool
  description = "Whether multi-attach is enabled"
}

variable "snapshot_id" {
  type        = string
  description = "Snapshot ID the volume was created from"
}