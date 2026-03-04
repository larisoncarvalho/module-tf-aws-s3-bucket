#!/bin/sh
set -e

echo "Importing module.vpc.aws_vpc.main..."
terraform import "module.vpc.aws_vpc.main" "vpc-024344e8549773d40"

echo "Importing module.vpc.aws_subnet.public_1a..."
terraform import "module.vpc.aws_subnet.public_1a" "subnet-0b77c0d76befaf70d"

echo "Importing module.security_group.aws_security_group.runner..."
terraform import "module.security_group.aws_security_group.runner" "sg-0d2894f23f4b8f7e7"

echo "Importing module.iam.aws_iam_role.runner..."
terraform import "module.iam.aws_iam_role.runner" "SG_RUNNER_new-ec2-private-runner-role"

echo "Importing module.iam.aws_iam_instance_profile.runner..."
terraform import "module.iam.aws_iam_instance_profile.runner" "SG_RUNNER_new-runner-instance-profile"

echo "Importing module.key_pair.aws_key_pair.runner..."
terraform import "module.key_pair.aws_key_pair.runner" "clara-sg-privaterunner"

echo "Importing module.volumes.aws_ebs_volume.root..."
terraform import "module.volumes.aws_ebs_volume.root" "vol-0972b44b3d0cb86f9"

echo "Importing module.volumes.aws_ebs_volume.data..."
terraform import "module.volumes.aws_ebs_volume.data" "vol-0f5a54343d85c2ca9"

echo "Importing module.volumes.aws_volume_attachment.root..."
terraform import "module.volumes.aws_volume_attachment.root" "/dev/xvda:vol-0972b44b3d0cb86f9:i-0073fcf5e556169e8"

echo "Importing module.volumes.aws_volume_attachment.data..."
terraform import "module.volumes.aws_volume_attachment.data" "/dev/sda1:vol-0f5a54343d85c2ca9:i-0073fcf5e556169e8"

echo "Importing module.instance.aws_network_interface.runner..."
terraform import "module.instance.aws_network_interface.runner" "eni-02b2519b0f908256d"

echo "Importing module.instance.aws_instance.runner..."
terraform import "module.instance.aws_instance.runner" "i-0073fcf5e556169e8"

echo "All imports completed successfully!"