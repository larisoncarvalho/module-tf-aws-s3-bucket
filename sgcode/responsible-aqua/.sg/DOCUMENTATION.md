# taher-private-runner-infrastructure

## Description

EC2 instance for a private Ubuntu GitLab runner with its dedicated key pair and elastic network interface in eu-central-1.

## Architecture Overview

```
root
├── module.key_pair   (./modules/key_pair)
│   └── aws_key_pair.this
└── module.instance   (./modules/instance)
    ├── aws_network_interface.this
    └── aws_instance.this
```

The `key_pair` module manages the RSA key pair used for SSH access. Its output `key_name` is wired directly into the `instance` module so the EC2 instance references the same key pair created within this stack.

## Modules

| Module | Path | Description |
|--------|------|-------------|
| `key_pair` | `modules/key_pair` | Manages the RSA key pair used for SSH access to the private runner instances |
| `instance` | `modules/instance` | Manages the taher-private-runner-ubuntu EC2 instance and its dedicated elastic network interface |

## Variables Reference

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `region` | `string` | `"eu-central-1"` | AWS region to deploy resources |
| `key_pair_key_name` | `string` | `"taher-private-runner"` | Name of the EC2 key pair |
| `key_pair_public_key` | `string` | `""` | **Must be set before apply.** Public key material for the taher-private-runner key pair |
| `instance_ami_id` | `string` | `"ami-03250b0e01c28d196"` | AMI ID for the EC2 instance |
| `instance_instance_type` | `string` | `"t2.medium"` | EC2 instance type |
| `instance_tenancy` | `string` | `"default"` | Instance tenancy setting |
| `instance_ebs_optimized` | `bool` | `false` | Whether the instance is EBS-optimized |
| `instance_monitoring` | `bool` | `false` | Whether detailed CloudWatch monitoring is enabled |
| `instance_hibernation` | `bool` | `false` | Whether hibernation is enabled |
| `instance_cpu_core_count` | `number` | `2` | Number of CPU cores |
| `instance_cpu_threads_per_core` | `number` | `1` | Threads per CPU core |
| `instance_metadata_http_endpoint` | `string` | `"enabled"` | IMDS HTTP endpoint setting |
| `instance_metadata_http_tokens` | `string` | `"required"` | IMDSv2 token requirement |
| `instance_metadata_http_put_response_hop_limit` | `number` | `2` | IMDS PUT response hop limit |
| `instance_enclave_options_enabled` | `bool` | `false` | Whether Nitro Enclaves are enabled |
| `instance_capacity_reservation_preference` | `string` | `"open"` | Capacity reservation preference |
| `instance_root_block_device_delete_on_termination` | `bool` | `true` | Delete root volume on termination |
| `instance_subnet_id` | `string` | `"subnet-072669658da496c4a"` | Subnet ID for the network interface |
| `instance_private_ip_address` | `string` | `"10.0.0.52"` | Primary private IP address |
| `instance_security_group_ids` | `list(string)` | `["sg-092a5ff991a0802bc"]` | Security groups for the network interface |
| `instance_source_dest_check` | `bool` | `true` | Source/destination check on the ENI |
| `instance_instance_name_tag` | `string` | `"taher-private-runner-ubuntu"` | Value for the Name tag |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `instance_id` | ID of the EC2 instance |
| `instance_private_ip` | Primary private IP address of the EC2 instance |
| `network_interface_id` | ID of the elastic network interface |
| `key_pair_key_name` | Name of the EC2 key pair |

## Usage

### Prerequisites

- Terraform or OpenTofu installed
- AWS credentials configured (environment variables, instance profile, or AWS config file)
- The public key material for `key_pair_public_key` must be placed in `environments/sg.tfvars` before running apply

### Workflow

```sh
# 1. Initialise providers and modules
terraform init

# 2. Import existing AWS resources into Terraform state
./imports.sh terraform

# 3. Verify zero drift — plan should show no changes
terraform plan -var-file environments/sg.tfvars

# 4. Apply if needed
terraform apply -var-file environments/sg.tfvars
```

> **Note:** `key_pair_public_key` is intentionally left empty in `environments/sg.tfvars` because the raw public key material is not available from AWS discovery data. You must supply the correct value before running `terraform apply` to avoid drift on the `aws_key_pair` resource.