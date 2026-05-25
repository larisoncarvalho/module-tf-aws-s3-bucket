data "google_iam_policy" "this" {
  dynamic "binding" {
    for_each = var.bindings
    content {
      role    = binding.value.role
      members = binding.value.members
    }
  }
}

resource "google_project_iam_policy" "this" {
  project     = var.project
  policy_data = data.google_iam_policy.this.policy_data
}