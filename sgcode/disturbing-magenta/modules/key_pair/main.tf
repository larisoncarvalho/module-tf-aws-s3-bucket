# Module: key_pair
# Manages a single aws_key_pair resource. The public_key argument is
# write-only (not returned by the API after creation), so a placeholder
# variable is used and the attribute is excluded from change detection
# via lifecycle ignore_changes.

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = var.public_key
  tags       = var.tags

  lifecycle {
    # public_key is write-only: the AWS API does not return it after creation.
    # A placeholder value is supplied; ignore_changes prevents spurious drift.
    ignore_changes = [public_key]
  }
}
