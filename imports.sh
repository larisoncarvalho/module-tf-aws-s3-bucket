#!/bin/sh
set -e

echo "Importing module.vpc.aws_vpc.main..."
terraform import "module.vpc.aws_vpc.main" "vpc-024344e8549773d40"

echo "Importing module.iam_profile.aws_iam_role.ec2_runner..."
terraform import "module.iam_profile.aws_iam_role.ec2_runner" "SG_RUNNER_new-ec2-private-runner-role"

echo "Importing module.iam_profile.aws_iam_instance_profile.runner..."
terraform import "module.iam_profile.aws_iam_instance_profile.runner" "SG_RUNNER_new-runner-instance-profile"

echo "Importing module.security_group.aws_security_group.runner..."
terraform import "module.security_group.aws_security_group.runner" "sg-0d2894f23f4b8f7e7"

echo "Importing module.subnet.aws_subnet.main..."
terraform import "module.subnet.aws_subnet.main" "subnet-0b77c0d76befaf70d"

echo "Importing module.launch_template.aws_launch_template.runner..."
terraform import "module.launch_template.aws_launch_template.runner" "lt-0214ccad66ff870eb"

echo "Importing module.asg.aws_autoscaling_group.runner..."
terraform import "module.asg.aws_autoscaling_group.runner" "SG_RUNNER_new-private-runner-asg"

echo "All resources imported successfully!"