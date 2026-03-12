#!/bin/sh
set -e

terraform import 'module.ec2_private_runner.aws_instance.this' 'i-0a0ca27d00e7e74b9'