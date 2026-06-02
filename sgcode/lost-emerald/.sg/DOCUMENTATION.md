# adhoc-lambda-infrastructure

Lambda function with IAM execution role

## Architecture

This stack provisions a Lambda function with its IAM execution role in the eu-central-1 region.

### Modules

#### iam_role
IAM role for Lambda function execution

**Resources:**
- `aws_iam_role.this` - IAM role with Lambda assume role policy
- `aws_iam_role_policy_attachment.this` - Policy attachments for the role

**Inputs:**
| Name | Type | Description |
|------|------|-------------|
| role_name | string | Name of the IAM role |
| role_path | string | Path for the IAM role |
| assume_role_policy_document | object | Assume role policy document |
| max_session_duration | number | Maximum session duration in seconds |
| attached_policies | map(object) | Policies to attach to the role |

**Outputs:**
| Name | Description |
|------|-------------|
| role_arn | ARN of the IAM role |
| role_name | Name of the IAM role |

#### lambda_function
Lambda function with execution configuration

**Resources:**
- `aws_lambda_function.this` - Lambda function

**Inputs:**
| Name | Type | Description |
|------|------|-------------|
| function_name | string | Name of the Lambda function |
| role_arn | string | ARN of the IAM role for Lambda execution |
| handler | string | Lambda function handler |
| runtime | string | Lambda runtime |
| timeout | number | Function timeout in seconds |
| memory_size | number | Memory allocated to the function in MB |
| architectures | list(string) | Instruction set architecture |
| package_type | string | Lambda deployment package type |
| filename | string | Path to the function deployment package |
| source_code_hash | string | Base64-encoded SHA256 hash of the package file |

**Outputs:**
| Name | Description |
|------|-------------|
| function_arn | ARN of the Lambda function |
| function_name | Name of the Lambda function |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | AWS region | eu-central-1 |
| lambda_basic_execution_policy_arn | string | ARN of the Lambda basic execution policy | arn:aws:iam::790543352839:policy/service-role/AWSLambdaBasicExecutionRole-8a809453-e605-4ff4-bf2f-2cb5c9087fb1 |
| lambda_package_path | string | Path to the Lambda deployment package | ./lambda_deployment_package.zip |
| lambda_source_code_hash | string | Base64-encoded SHA256 hash of the Lambda package | nmLnN+6QcaM3HcF5CTmZf//TNex2j12l7YlYuEPhR7I= |

## Root Outputs

| Name | Description |
|------|-------------|
| lambda_function_arn | ARN of the Lambda function |
| lambda_role_arn | ARN of the Lambda IAM role |

## Usage

### Prerequisites

Ensure you have the Lambda deployment package at `./lambda_deployment_package.zip` before running Terraform.

### Deployment

```bash
# Initialize Terraform
terraform init

# Import existing resources
chmod +x imports.sh
./imports.sh terraform

# Review planned changes
terraform plan -var-file=environments/terraform.tfvars

# Apply configuration
terraform apply -var-file=environments/terraform.tfvars
```

### Import Script

The `imports.sh` script imports existing AWS resources into Terraform state. Run it after `terraform init` and before `terraform plan`.