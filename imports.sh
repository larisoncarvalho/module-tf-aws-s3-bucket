#!/bin/sh
set -e

echo "Importing module.vpc.aws_vpc.main..."
terraform import "module.vpc.aws_vpc.main" "vpc-072700b7336ad0752"

echo "Importing module.vpc.aws_subnet.public_1a..."
terraform import "module.vpc.aws_subnet.public_1a" "subnet-0587478b1e052ce6a"

echo "Importing module.vpc.aws_subnet.public_1b..."
terraform import "module.vpc.aws_subnet.public_1b" "subnet-03a230a9d1b8b9036"

echo "Importing module.vpc.aws_subnet.private_1a..."
terraform import "module.vpc.aws_subnet.private_1a" "subnet-0e4b2d1e5907c198e"

echo "Importing module.vpc.aws_subnet.private_1b..."
terraform import "module.vpc.aws_subnet.private_1b" "subnet-0fedab5812fadb197"

echo "Importing module.vpc.aws_internet_gateway.main..."
terraform import "module.vpc.aws_internet_gateway.main" "igw-081452c458c193e5e"

echo "Importing module.vpc.aws_route_table.public..."
terraform import "module.vpc.aws_route_table.public" "rtb-0586c5f005575838b"

echo "Importing module.vpc.aws_route.public_internet_gateway..."
terraform import "module.vpc.aws_route.public_internet_gateway" "rtb-0586c5f005575838b_0.0.0.0/0"

echo "Importing module.vpc.aws_route_table_association.public_1a..."
terraform import "module.vpc.aws_route_table_association.public_1a" "subnet-0587478b1e052ce6a/rtb-0586c5f005575838b"

echo "Importing module.vpc.aws_route_table_association.public_1b..."
terraform import "module.vpc.aws_route_table_association.public_1b" "subnet-03a230a9d1b8b9036/rtb-0586c5f005575838b"

echo "Importing module.vpc.aws_route_table.private_1a..."
terraform import "module.vpc.aws_route_table.private_1a" "rtb-0cf4f2a86fa45c666"

echo "Importing module.vpc.aws_route_table_association.private_1a..."
terraform import "module.vpc.aws_route_table_association.private_1a" "subnet-0e4b2d1e5907c198e/rtb-0cf4f2a86fa45c666"

echo "Importing module.vpc.aws_route_table.private_1b..."
terraform import "module.vpc.aws_route_table.private_1b" "rtb-0b2b15707a5f8b488"

echo "Importing module.vpc.aws_route_table_association.private_1b..."
terraform import "module.vpc.aws_route_table_association.private_1b" "subnet-0fedab5812fadb197/rtb-0b2b15707a5f8b488"

echo "Importing module.vpc.aws_default_route_table.default..."
terraform import "module.vpc.aws_default_route_table.default" "rtb-087abcdcb9e173b0c"

echo "Importing module.vpc.aws_default_security_group.default..."
terraform import "module.vpc.aws_default_security_group.default" "sg-080c3f9f0365043a9"

echo "Importing module.vpc.aws_default_network_acl.default..."
terraform import "module.vpc.aws_default_network_acl.default" "acl-0210dae0f5062d949"

echo "All imports completed successfully!"