# ec2-instances

EC2 instances in eu-central-1

## Overview

This stack manages EC2 instances using a single module that creates instances based on a map of instance configurations.

## Modules

### instance

Manages EC2 instances with full configuration support including metadata options and root block device settings.

**Location:** `modules/instance/`

**Resources:**
- `aws_instance.this` (for_each)

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |
| instances | map(object) | EC2 instances to create | - |

### instances object structure

```hcl
{
  ami_id                 = string
  instance_type          = string
  availability_zone      = string
  key_name               = string
  ebs_optimized          = bool
  monitoring             = bool
  tenancy                = string
  subnet_id              = string
  vpc_security_group_ids = list(string)
  source_dest_check      = bool
  private_ip             = string
  metadata_options = object({
    http_endpoint               = string
    http_tokens                 = string
    http_put_response_hop_limit = number
    instance_metadata_tags      = string
  })
  root_block_device = object({
    volume_type           = string
    delete_on_termination = bool
  })
  tags = map(string)
}
```

## Outputs

| Name | Description |
|------|-------------|
| instance_ids | Map of instance keys to instance IDs |
| instance_arns | Map of instance keys to instance ARNs |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh terraform
```

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- This stack imports existing EC2 instances
- After import, `terraform plan` should show no changes
- Instance configurations are defined in `environments/terraform.tfvars`
- Two instances are managed: `nomatch_ec2_1` and `taher_private_runner_amz`