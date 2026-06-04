variable "name" {
  type        = string
  description = "Name of the managed disk"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where the managed disk exists"
}

variable "storage_account_type" {
  type        = string
  description = "Storage account type for the managed disk"
}

variable "create_option" {
  type        = string
  description = "Create option for the managed disk"
}

variable "disk_size_gb" {
  type        = number
  description = "Size of the managed disk in GB"
}

variable "os_type" {
  type        = string
  description = "Operating system type for the managed disk"
}

variable "zone" {
  type        = string
  description = "Availability zone for the managed disk"
}

variable "hyper_v_generation" {
  type        = string
  description = "Hyper-V generation for the managed disk"
}

variable "image_reference_id" {
  type        = string
  description = "Image reference ID for the managed disk"
}

variable "trusted_launch_enabled" {
  type        = bool
  description = "Whether trusted launch is enabled for the managed disk"
}