variable "bigquery_datasets" {
  type = map(object({
    dataset_id  = string
    project     = string
    location    = string
    description = optional(string, "")
    labels      = optional(map(string), {})
    access = optional(list(object({
      role           = optional(string)
      special_group  = optional(string)
      user_by_email  = optional(string)
      group_by_email = optional(string)
      domain         = optional(string)
      iam_member     = optional(string)
    })), [])
  }))
  default = {}
}
