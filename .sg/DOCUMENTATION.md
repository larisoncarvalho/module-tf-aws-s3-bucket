# multi-service-infrastructure

Manages Athena workgroup and API Gateway REST APIs

## Overview

This stack manages the following resources:
- 1 Athena workgroup
- 3 API Gateway REST APIs

## Modules

### athena_workgroup
Manages Athena workgroup configuration

**Resources:**
- `aws_athena_workgroup.this`

### api_gateway_rest_api
Manages API Gateway REST API

**Resources:**
- `aws_api_gateway_rest_api.this`

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | - |

## Outputs

| Name | Description |
|------|-------------|
| de_manuel_meireles_workgroup_id | ID of de-manuel-meireles primary workgroup |
| platform_api_dev_id | ID of platform-api-dev |
| sg_api_qa_id | ID of sg-api-qa |
| arunim_test_api_id | ID of arunim-test-api |

## Usage

1. Initialize the working directory:
```bash
tofu init
```

2. Import existing resources:
```bash
chmod +x imports.sh
./imports.sh tofu
```

3. Review the execution plan:
```bash
tofu plan -var-file=environments/terraform.tfvars
```

4. Apply the configuration:
```bash
tofu apply -var-file=environments/terraform.tfvars
```

## Module Instances

### de_manuel_meireles_primary_workgroup
Primary Athena workgroup for de-manuel-meireles with SSE-S3 encryption and CloudWatch metrics enabled.

### platform_api_dev
API Gateway REST API created by Zappa for platform-api-dev.

### sg_api_qa
API Gateway REST API for sg-api-qa environment.

### arunim_test_api
API Gateway REST API for arunim test environment.