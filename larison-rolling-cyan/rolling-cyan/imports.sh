#!/bin/sh
set -e

# No imports needed - creating new route tables
# If you need to import existing route tables, verify they exist first:
# terraform import module.sg_vpc_2_default.aws_route_table.this rtb-ACTUAL-ID
echo "No imports configured - will create new resources"