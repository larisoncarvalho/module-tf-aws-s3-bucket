# backup-vault-infrastructure

AWS Backup vault with cross-account copy policy

## Overview

This stack manages an AWS Backup vault with KMS encryption and a cross-account access policy that allows backup copy operations from resources within a specific AWS Organization.

## Modules

### backup_vault

Manages AWS Backup vault with encryption and access policy

**Resources:**
- `aws_backup_vault.this` - Backup vault with KMS encryption
- `aws_backup_vault_policy.this` - Vault access policy for cross-account operations

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| kms_key_arn | string | ARN of the KMS key used for vault encryption | arn:aws:kms:eu-central-1:790543352839:key/a625e80c-52a7-4650-b547-acffe08405ee |

## Outputs

| Name | Description |
|------|-------------|
| vault_name | Name of the backup vault |
| vault_arn | ARN of the backup vault |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh terraform
```

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- The vault uses KMS encryption for backup data protection
- The vault policy allows `backup:CopyIntoBackupVault` from principals within organization `o-ohixe8qfps`
- This configuration supports cross-account backup copy scenarios within the same AWS Organization