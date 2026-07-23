#!/bin/sh
set -e

TF_BIN_PATH="$1"
[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.acm_certificate.aws_acm_certificate.this' 'arn:aws:acm:eu-central-1:790543352839:certificate/c12e4f53-dd2a-4597-994d-2752c994a4e9'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.athena_workgroup.aws_athena_workgroup.this' 'primary'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.backup_vault.aws_backup_vault.this' 'Default'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.autoscaling_group.aws_autoscaling_group.this' 'taher-private-runner'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.instance_i_0439c48efdf4ad956.aws_instance.this' 'i-0439c48efdf4ad956'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.network_interface_eni_02b2519b0f908256d.aws_network_interface.this' 'eni-02b2519b0f908256d'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.security_group_ec2_sg_v815bfuv.aws_security_group.this' 'sg-0011fd425b881f7cb'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.subnet_vpc_name_public_eu_central_1a.aws_subnet.this' 'subnet-0b77c0d76befaf70d'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.vpc_vpc_name.aws_vpc.this' 'vpc-024344e8549773d40'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.iam_policy_ebs_csi.aws_iam_policy.this' 'ANPA3QEAOIQD2U5I35WY6'