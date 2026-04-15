# Backup Operator Role Stack

## Overview

This stack manages the Azure built-in Backup Operator role definition with comprehensive backup management permissions. The role allows users to manage backup services, excluding removal of backup, vault creation, and granting access to others.

## Stack Description

Azure built-in Backup Operator role definition with backup management permissions

**Region:** global

## Module Overview

### role_definition

Manages Azure role definition for backup operations

**Resources:**
- `azurerm_role_definition.this` - Azure role definition with backup operator permissions

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | Azure region for the resources | global |

## Outputs Reference

| Name | Description |
|------|-------------|
| backup_operator_role_id | The ID of the Backup Operator role definition |
| backup_operator_resource_id | The resource ID of the Backup Operator role definition |

## Usage Instructions

### 1. Initialize Terraform

```bash
tofu1.11.2 init
```

### 2. Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### 3. Review Changes

```bash
tofu1.11.2 plan -var-file environments/terraform.tfvars
```

### 4. Apply Configuration

```bash
tofu1.11.2 apply -var-file environments/terraform.tfvars
```

## Role Permissions

The Backup Operator role includes permissions for:

- Reading authorization and network resources
- Managing Recovery Services vault backup operations
- Managing backup jobs, policies, and protected items
- Performing backup and restore operations
- Managing Data Protection backup vaults and instances
- Cross-region restore capabilities
- Resource guard proxy management
- Support ticket creation

## Notes

- This role definition is created at the root scope ("/")
- The role can be assigned at the root scope or any child scope
- This is an import-only configuration for the existing Azure built-in role
- The role ID `00c29273-979b-4161-815c-10b084fb9324` is the Azure built-in Backup Operator role