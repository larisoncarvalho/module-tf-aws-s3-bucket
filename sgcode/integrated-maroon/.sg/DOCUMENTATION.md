# gcs-sg-infra2code-buck

## Description

Google Cloud Storage bucket with uniform bucket-level access enabled.

## Module Overview

| Module | Description |
|--------|-------------|
| `storage_bucket` | Manages the GCS bucket sg_infra2code_buck |

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `google_storage_bucket` | `this` | The GCS bucket |

## Variables Reference

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `region` | `string` | The GCP region for the provider | — |
| `bucket_name` | `string` | The name of the GCS bucket | — |
| `bucket_location` | `string` | The GCS location of the bucket | — |
| `bucket_storage_class` | `string` | The storage class of the bucket | — |
| `bucket_uniform_bucket_level_access` | `bool` | Enables uniform bucket-level access on the bucket | — |
| `bucket_default_event_based_hold` | `bool` | Whether to automatically apply an eventBasedHold to new objects | — |
| `bucket_requester_pays` | `bool` | Enables Requester Pays on the bucket | — |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `bucket_name` | The name of the GCS bucket |
| `bucket_url` | The base URL of the bucket |
| `self_link` | The URI of the created resource |

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