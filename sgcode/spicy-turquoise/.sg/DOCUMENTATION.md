# ec2-instance-eu-central-1

## Description

EC2 instance running in eu-central-1a with associated network and security configuration.

## Module Overview

| Module | Description |
|--------|-------------|
| `instance` | Manages the EC2 instance and its configuration |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | `string` | AWS region where resources are managed | — |
| `ami` | `string` | AMI ID to use for the instance | — |
| `instance_type` | `string` | EC2 instance type | — |
| `availability_zone` | `string` | Availability zone to launch the instance in | — |
| `key_name` | `string` | Key pair name to use for the instance | — |
| `subnet_id` | `string` | VPC subnet ID to launch the instance in | — |
| `vpc_security_group_ids` | `list(string)` | List of security group IDs to associate with the instance | — |
| `source_dest_check` | `bool` | Whether to enable source/destination check on the instance | — |
| `ebs_optimized` | `bool` | Whether the instance is EBS optimized | — |
| `monitoring` | `bool` | Whether detailed monitoring is enabled | — |
| `tenancy` | `string` | Tenancy of the instance | — |
| `capacity_reservation_preference` | `string` | Capacity reservation preference for the instance | — |
| `metadata_http_endpoint` | `string` | Whether the metadata service HTTP endpoint is enabled | — |
| `metadata_http_protocol_ipv6` | `string` | Whether the IPv6 endpoint for instance metadata service is enabled | — |
| `metadata_http_put_response_hop_limit` | `number` | HTTP PUT response hop limit for instance metadata requests | — |
| `metadata_http_tokens` | `string` | Whether session tokens are required for metadata service (IMDSv2) | — |
| `metadata_instance_metadata_tags` | `string` | Whether access to instance tags from metadata service is enabled | — |
| `enclave_options_enabled` | `bool` | Whether Nitro Enclaves are enabled on the instance | — |
| `root_block_device_delete_on_termination` | `bool` | Whether the root block device is deleted on instance termination | — |

## Outputs Reference

| Name | Description |
|------|-------------|
| `instance_id` | ID of the EC2 instance |
| `private_ip` | Private IP address of the EC2 instance |
| `public_ip` | Public IP address of the EC2 instance |

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

## Resource Details

- **EC2 Instance**: `i-00af4198af591318c` — `t3.micro` running in `eu-central-1a`
- **AMI**: `ami-01b5c3cf789dbf1fb`
- **Subnet**: `subnet-0b77c0d76befaf70d`
- **Security Groups**: `sg-0373ac5706eeaf25d`
- **IMDSv2**: `optional` (consider upgrading to `required` for enhanced security)