resource "aws_backup_vault" "this" {
  name        = var.vault_name
  kms_key_arn = var.kms_key_arn
}

resource "aws_backup_vault_policy" "this" {
  backup_vault_name = aws_backup_vault.this.name
  policy            = var.vault_policy
}