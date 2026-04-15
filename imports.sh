#!/bin/sh
set -e

terraform import 'module.instance.aws_instance.this["taher_private_runner_amz"]' 'i-01494deda99ac7624'