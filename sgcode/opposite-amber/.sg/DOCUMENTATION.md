# platform-services-ecs

## Description

ECS cluster for platform services in eu-central-1.

## Module Overview

| Module | Description |
|--------|-------------|
| `ecs_cluster` | Manages the platform-services ECS cluster and its settings |

## Resources

| Resource | Type | Description |
|----------|------|-------------|
| `aws_ecs_cluster.this` | `aws_ecs_cluster` | The platform-services ECS cluster |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region where resources will be managed | — |
| `ecs_cluster_name` | `string` | Name of the ECS cluster | — |
| `ecs_cluster_container_insights` | `string` | Value for the containerInsights cluster setting (enhanced, enabled, or disabled) | — |
| `ecs_cluster_tags` | `map(string)` | Key-value map of resource tags for the ECS cluster | — |

## Outputs Reference

| Name | Description |
|------|-------------|
| `cluster_arn` | ARN that identifies the ECS cluster |
| `cluster_name` | Name of the ECS cluster |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
chmod +x imports.sh
./imports.sh terraform
# or for OpenTofu:
./imports.sh tofu
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```