#!/bin/sh
set -e

terraform import module.sg_vpc_jkdsbfkjdsabv_default.aws_route_table.this rtb-003238d030204473e
terraform import module.sg_vpc_2_default.aws_route_table.this rtb-0072093ae36ed4bb8