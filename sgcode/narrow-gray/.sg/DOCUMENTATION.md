# taher-private-runner-ubuntu

## Description

EC2 instance serving as a private runner (Ubuntu) in eu-central-1.

## Module Overview

| Module | Description |
|--------|-------------|
| `instance` | Manages the taher-private-runner-ubuntu EC2 instance |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region where resources will be managed | — |
| `ami` | `string` | AMI ID to use for the instance | — |
| `instance_type` | `string` | EC2 instance type | — |
| `availability_zone` | `string` | Availability zone to launch the instance in | — |
| `key_name` | `string` | Key pair name for the instance | — |
| `subnet_id` | `string` | VPC subnet ID to launch the instance in | — |
| `vpc_security_group_ids` | `list(string)` | List of security group IDs to associate with the instance | — |
| `source_dest_check` | `bool` | Whether to enable source/destination check | — |
| `ebs_optimized` | `bool` | Whether the instance is EBS-optimized | — |
| `monitoring` | `bool` | Whether detailed monitoring is enabled | — |
| `tenancy` | `string` | Tenancy of the instance | — |
| `capacity_reservation_preference` | `string` | Capacity reservation preference for the instance | — |
| `cpu_core_count` | `number` | Number of CPU cores | — |
| `cpu_threads_per_core` | `number` | Number of threads per CPU core | — |
| `metadata_http_endpoint` | `string` | Whether the metadata service HTTP endpoint is enabled | — |
| `metadata_http_protocol_ipv6` | `string` | Whether the IPv6 metadata endpoint is enabled | — |
| `metadata_http_put_response_hop_limit` | `number` | HTTP PUT response hop limit for instance metadata requests | — |
| `metadata_http_tokens` | `string` | Whether IMDSv2 tokens are required | — |
| `metadata_instance_metadata_tags` | `string` | Whether instance metadata tags are enabled | — |
| `enclave_options_enabled` | `bool` | Whether Nitro Enclaves are enabled | — |
| `root_block_device_delete_on_termination` | `bool` | Whether the root EBS volume is deleted on instance termination | — |
| `name_tag` | `string` | Value for the Name tag on the instance | — |

## Outputs Reference

| Name | Description |
|------|-------------|
| `instance_id` | ID of the EC2 instance |
| `instance_arn` | ARN of the EC2 instance |
| `private_ip` | Private IP address of the EC2 instance |

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