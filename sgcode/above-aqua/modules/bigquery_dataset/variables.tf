variable "dataset_id" {
  description = "BigQuery dataset ID."
  type        = string
}

variable "project" {
  description = "GCP project ID."
  type        = string
}

variable "location" {
  description = "Dataset location/region."
  type        = string
}

variable "description" {
  description = "Dataset description."
  type        = string
  default     = ""
}

variable "labels" {
  description = "Labels to apply to the dataset."
  type        = map(string)
  default     = {}
}

variable "access" {
  description = "Access control entries for the dataset."
  type = list(object({
    role           = string
    special_group  = optional(string)
    user_by_email  = optional(string)
    group_by_email = optional(string)
    domain         = optional(string)
    iam_member     = optional(string)
  }))
  default = []
}
