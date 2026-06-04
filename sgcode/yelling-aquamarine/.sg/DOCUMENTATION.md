# arunim-gcp-kms-key-ring

## Description

GCP KMS Key Ring infrastructure for arunim-gcp-bucket-2.

## Module Overview

| Module | Description | Source |
|--------|-------------|--------|
| `kms_key_ring` | Manages a GCP KMS Key Ring | `./modules/kms_key_ring` |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | The region for the provider | `"us"` |
| `name` | `string` | The resource name for the KMS Key Ring | `"arunim-gcp-bucket-2"` |
| `location` | `string` | The location for the KMS Key Ring | `"us"` |
| `project` | `string` | The ID of the GCP project | `"stackguardian-nonprod"` |

## Outputs Reference

| Name | Description |
|------|-------------|
| `kms_key_ring_id` | The identifier of the KMS Key Ring |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
chmod +x imports.sh
./imports.sh terraform
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```