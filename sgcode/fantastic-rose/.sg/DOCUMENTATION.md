# taher-private-runner-infrastructure

## Description

EC2 instance with key pair and network interface for taher private runner. Deployed in `eu-central-1`.

## Module Overview

| Module | Description |
|--------|-------------|
| `key_pair` | Manages the taher-private-runner key pair (`aws_key_pair`) |
| `network_interface` | Manages the primary network interface for the taher private runner instance (`aws_network_interface`) |
| `instance` | Manages the taher-private-runner-ubuntu EC2 instance (`aws_instance`) |

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| `region` | string | AWS region |
| `key_pair_key_name` | string | The name for the key pair |
| `key_pair_public_key` | string (sensitive) | The public key material for the key pair |
| `network_interface_subnet_id` | string | Subnet ID to create the ENI in |
| `network_interface_private_ip_address` | string | Primary private IP address to assign to the ENI |
| `network_interface_security_group_id` | string | Security group ID to assign to the ENI |
| `network_interface_source_dest_check` | bool | Whether to enable source destination checking for the ENI |
| `instance_ami_id` | string | AMI ID to use for the instance |
| `instance_instance_type` | string | Instance type to use for the instance |
| `instance_availability_zone` | string | Availability zone to start the instance in |
| `instance_tenancy` | string | Tenancy of the instance |
| `instance_ebs_optimized` | bool | Whether the launched EC2 instance will be EBS-optimized |
| `instance_source_dest_check` | bool | Controls if traffic is routed to the instance when the destination address does not match the instance |
| `instance_monitoring` | bool | Whether the launched EC2 instance will have detailed monitoring enabled |
| `instance_security_group_id` | string | Security group ID to associate with the instance |
| `instance_subnet_id` | string | VPC Subnet ID to launch in |
| `instance_private_ip` | string | Private IP address to associate with the instance in a VPC |
| `instance_capacity_reservation_preference` | string | Indicates the instance's Capacity Reservation preferences |
| `instance_metadata_http_endpoint` | string | Whether the metadata service is available |
| `instance_metadata_http_protocol_ipv6` | string | Whether the IPv6 endpoint for the instance metadata service is enabled |
| `instance_metadata_http_put_response_hop_limit` | number | Desired HTTP PUT response hop limit for instance metadata requests |
| `instance_metadata_http_tokens` | string | Whether or not the metadata service requires session tokens |
| `instance_metadata_instance_metadata_tags` | string | Enables or disables access to instance tags from the instance metadata service |
| `instance_enclave_options_enabled` | bool | Whether Nitro Enclaves will be enabled on the instance |
| `instance_root_block_device_delete_on_termination` | bool | Whether the root volume should be destroyed on instance termination |
| `instance_name_tag` | string | Name tag for the instance |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `instance_id` | ID of the EC2 instance |
| `instance_private_ip` | Private IP address of the EC2 instance |
| `network_interface_id` | ID of the network interface |
| `key_pair_key_name` | The key pair name |

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

## Notes

- `key_pair_public_key` is a sensitive variable. Set it via environment variable `TF_VAR_key_pair_public_key` or a secrets manager rather than storing it in plain text in the tfvars file.
- The `key_pair` module imports the existing key pair by name. The AWS API does not return the public key, so after import you must supply the correct public key value to avoid drift.
- The `network_interface` and `instance` modules both reference the same subnet and security group, reflecting the existing infrastructure topology.