bigquery_datasets = {
  "sg_infra_2_code" = {
    dataset_id  = "sg_infra_2_code"
    project     = "stackguardian-nonprod"
    location    = "EU"
    description = ""
    labels      = {}
    access = [
      {
        role          = "WRITER"
        special_group = "projectWriters"
      },
      {
        role          = "OWNER"
        special_group = "projectOwners"
      },
      {
        role          = "OWNER"
        user_by_email = "digbijayinee.clara@stackguardian.io"
      },
      {
        role          = "READER"
        special_group = "projectReaders"
      },
    ]
  }
}
