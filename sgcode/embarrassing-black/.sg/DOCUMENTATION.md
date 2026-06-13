# rome-artifact-registry

## Description

Artifact Registry repository for the rome project.

## Module Overview

| Module | Description |
|--------|-------------|
| `artifact_registry_repository` | Manages the Google Artifact Registry repository |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | The GCP region for the provider | — |
| `repository_id` | `string` | The last part of the repository name | — |
| `format` | `string` | The format of packages stored in the repository | — |
| `location` | `string` | The name of the repository's location | — |
| `mode` | `string` | The mode configures the repository to serve artifacts from different sources | — |
| `labels` | `map(string)` | Labels with user-defined metadata | — |
| `cleanup_policy_dry_run` | `bool` | If true, the cleanup pipeline is prevented from deleting versions in this repository | — |

## Outputs Reference

| Name | Description |
|------|-------------|
| `repository_id` | The repository ID |
| `name` | The name of the repository |
| `registry_uri` | The repository endpoint URI |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
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