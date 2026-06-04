# taher-private-runner-infrastructure

## Description

EC2 instance with associated EBS volume, key pair, and network interface for the taher-private-runner Ubuntu runner. Deployed in the `eu-central-1` AWS region.

## Module Overview

| Module | Description |
|--------|-------------|
| `instance` | Manages the taher-private-runner-ubuntu EC2 instance |
| `ebs_volume` | Manages the EBS volume attached to the taher-private-runner-ubuntu instance |
| `key_pair` | Manages the taher-private-runner key pair |
| `network_interface` | Manages the primary network interface for the taher-private-runner-ubuntu instance |

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| `region` | `string` | AWS region to deploy resources in |
| `instance_ami` | `string` | AMI ID to use for the EC2 instance |
| `instance_instance_type` | `string` | EC2 instance type |
| `instance_availability_zone` | `string` | Availability zone for the EC2 instance |
| `instance_subnet_id` | `string` | Subnet ID to launch the EC2 instance in |
| `instance_vpc_security_group_ids` | `list(string)` | List of security group IDs to associate with the EC2 instance |
| `instance_source_dest_check` | `bool` | Whether to enable source/destination check on the EC2 instance |
| `instance_ebs_optimized` | `bool` | Whether the EC2 instance is EBS optimized |
| `instance_monitoring` | `bool` | Whether detailed monitoring is enabled on the EC2 instance |
| `instance_tenancy` | `string` | Tenancy of the EC2 instance |
| `instance_tags` | `map(string)` | Tags to assign to the EC2 instance |
| `instance_metadata_http_endpoint` | `string` | Whether the metadata service is available |
| `instance_metadata_http_protocol_ipv6` | `string` | Whether the IPv6 endpoint for IMDS is enabled |
| `instance_metadata_http_put_response_hop_limit` | `number` | HTTP PUT response hop limit for instance metadata requests |
| `instance_metadata_http_tokens` | `string` | Whether IMDSv2 is required |
| `instance_metadata_instance_metadata_tags` | `string` | Whether instance tags are accessible from instance metadata |
| `instance_capacity_reservation_preference` | `string` | Capacity reservation preference for the EC2 instance |
| `instance_enclave_options_enabled` | `bool` | Whether Nitro Enclaves are enabled on the EC2 instance |
| `instance_root_block_device_delete_on_termination` | `bool` | Whether the root volume should be deleted on instance termination |
| `ebs_volume_availability_zone` | `string` | Availability zone where the EBS volume exists |
| `ebs_volume_size` | `number` | Size of the EBS volume in GiB |
| `ebs_volume_type` | `string` | Type of EBS volume |
| `ebs_volume_iops` | `number` | Amount of IOPS provisioned for the EBS volume |
| `ebs_volume_throughput` | `number` | Throughput in MiB/s for the EBS volume |
| `ebs_volume_encrypted` | `bool` | Whether the EBS volume is encrypted |
| `ebs_volume_multi_attach_enabled` | `bool` | Whether multi-attach is enabled on the EBS volume |
| `ebs_volume_snapshot_id` | `string` | Snapshot ID the EBS volume was created from |
| `key_pair_key_name` | `string` | Name of the key pair |
| `key_pair_public_key` | `string` | Public key material for the key pair (sensitive) |
| `network_interface_subnet_id` | `string` | Subnet ID for the network interface |
| `network_interface_private_ips` | `list(string)` | Private IP addresses assigned to the network interface |
| `network_interface_security_groups` | `list(string)` | Security group IDs assigned to the network interface |
| `network_interface_source_dest_check` | `bool` | Whether source/destination check is enabled on the network interface |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `instance_id` | ID of the EC2 instance |
| `primary_network_interface_id` | ID of the primary network interface of the instance |
| `ebs_volume_id` | ID of the EBS volume |
| `key_name` | Name of the key pair |
| `network_interface_id` | ID of the network interface |

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

> **Note:** The `key_pair_public_key` variable is sensitive. Supply it via an environment variable or a secrets manager rather than storing it in plain text:
> ```sh
> export TF_VAR_key_pair_public_key="ssh-rsa AAAA..."
> ```