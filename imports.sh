#!/bin/sh
set -e

echo "Importing module.vpc.aws_vpc.main..."
terraform import "module.vpc.aws_vpc.main" "vpc-024344e8549773d40"

echo "Importing module.iam.aws_iam_role.runner..."
terraform import "module.iam.aws_iam_role.runner" "SG_RUNNER_new-ec2-private-runner-role"

echo "Importing module.iam.aws_iam_instance_profile.runner..."
terraform import "module.iam.aws_iam_instance_profile.runner" "SG_RUNNER_new-runner-instance-profile"

echo "Importing module.security_group.aws_security_group.runner..."
terraform import "module.security_group.aws_security_group.runner" "sg-0d2894f23f4b8f7e7"

echo "Importing module.runner.aws_instance.runner..."
terraform import "module.runner.aws_instance.runner" "i-0073fcf5e556169e8"

echo "All resources imported successfully!"