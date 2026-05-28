variable "disk_name" {
  description = "Name of the managed disk"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the managed disk exists"
  type        = string
}

variable "storage_account_type" {
  description = "Storage account type for the managed disk"
  type        = string
}

variable "create_option" {
  description = "Create option for the managed disk"
  type        = string
}

variable "disk_size_gb" {
  description = "Size of the managed disk in GB"
  type        = number
}

variable "os_type" {
  description = "OS type of the managed disk"
  type        = string
}

variable "hyper_v_generation" {
  description = "Hyper-V generation of the managed disk"
  type        = string
  default     = null
}

variable "trusted_launch_enabled" {
  description = "Whether trusted launch is enabled for the managed disk"
  type        = bool
  default     = null
}

variable "zone" {
  description = "Availability zone for the managed disk"
  type        = string
  default     = null
}

variable "image_reference_id" {
  description = "ID of an existing platform/marketplace disk image to copy when create_option is FromImage"
  type        = string
  default     = null
}