#!/bin/sh
set -e

# IMPORT THE IAM ROLE ITSELF
"$1" import -var-file environments/sg.tfvars \
  'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role.this' \
  'non-prod-adis-us-west-2-admin-task-execution-role'

# IMPORT EACH ATTACHED POLICY
"$1" import -var-file environments/sg.tfvars \
  'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]' \
  'non-prod-adis-us-west-2-admin-task-execution-role/arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy'

"$1" import -var-file environments/sg.tfvars \
  'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"]' \
  'non-prod-adis-us-west-2-admin-task-execution-role/arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess'

"$1" import -var-file environments/sg.tfvars \
  'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]' \
  'non-prod-adis-us-west-2-admin-task-execution-role/arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess'

"$1" import -var-file environments/sg.tfvars \
  'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess"]' \
  'non-prod-adis-us-west-2-admin-task-execution-role/arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess'