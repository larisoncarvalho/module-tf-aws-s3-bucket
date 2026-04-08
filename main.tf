module "backup_vault" {
  source = "./modules/backup_vault"

  vault_name    = "Default"
  kms_key_arn   = var.kms_key_arn
  vault_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "backup:CopyIntoBackupVault"
        Resource  = "*"
        Condition = {
          StringEquals = {
            "aws:PrincipalOrgID" = "o-ohixe8qfps"
          }
        }
      }
    ]
  }
}