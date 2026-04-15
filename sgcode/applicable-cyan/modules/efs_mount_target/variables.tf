variable "file_system_id" {
  type        = string
  description = "EFS file system ID"
}

variable "mount_targets" {
  type = map(object({
    subnet_id       = string
    security_groups = list(string)
    ip_address      = string
  }))
  description = "Map of mount targets to create"
  default     = {}
}