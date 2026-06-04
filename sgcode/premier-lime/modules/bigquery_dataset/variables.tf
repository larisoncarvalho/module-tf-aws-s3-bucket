variable "dataset_id" {
  type        = string
  description = "BigQuery dataset ID"
}

variable "project" {
  type        = string
  description = "GCP project ID"
}

variable "location" {
  type        = string
  description = "Dataset location"
}

variable "description" {
  type        = string
  default     = ""
  description = "Dataset description"
}

variable "labels" {
  type        = map(string)
  default     = {}
  description = "Labels to apply to the dataset"
}

variable "access" {
  type = list(object({
    role           = optional(string)
    special_group  = optional(string)
    user_by_email  = optional(string)
    group_by_email = optional(string)
    domain         = optional(string)
    iam_member     = optional(string)
  }))
  default     = []
  description = "Access control entries for the dataset"
}
