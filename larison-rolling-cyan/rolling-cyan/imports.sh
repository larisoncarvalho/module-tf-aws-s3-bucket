#!/bin/sh
set -e

# Only import route tables that actually exist in AWS
terraform import module.sg_vpc_2_default.aws_route_table.this rtb-0072093ae36ed4bb8