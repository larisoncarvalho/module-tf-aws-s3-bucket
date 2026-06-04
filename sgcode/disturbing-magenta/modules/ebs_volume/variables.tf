# Variables for the ebs_volume module. Each attribute that may differ between
# volumes is declared here.

variable "availability_zone" {
  description = "Availability zone in which to create the volume."
  type        = string
}

variable "size" {
  description = "Volume size in GiB."
  type        = number
}

variable "type" {
  description = "Volume type (gp2, gp3, io1, io2, sc1, st1, standard)."
  type        = string
  default     = "gp2"
}

variable "iops" {
  description = "Provisioned IOPS (for io1/io2/gp3). Null for other types."
  type        = number
  default     = null
}

variable "throughput" {
  description = "Throughput in MiB/s (for gp3). Null for other types."
  type        = number
  default     = null
}

variable "encrypted" {
  description = "Whether the volume is encrypted."
  type        = bool
  default     = false
}

variable "snapshot_id" {
  description = "Snapshot ID to create the volume from (null for empty volume)."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to assign to the volume."
  type        = map(string)
  default     = {}
}
