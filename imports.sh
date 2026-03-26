#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.role_0eu096k_9ci2y0p.aws_iam_role.this "0eu096k-9ci2y0p"
terraform import -var-file=environments/terraform.tfvars 'module.role_0eu096k_9ci2y0p.aws_iam_role_policy.this["policy_1"]' "0eu096k-9ci2y0p:0eu096k-9ci2y0p-policy"
terraform import -var-file=environments/terraform.tfvars module.role_0eu096k_ing4i1.aws_iam_role.this "0eu096k-ing4i1"
terraform import -var-file=environments/terraform.tfvars 'module.role_0eu096k_ing4i1.aws_iam_role_policy.this["policy_1"]' "0eu096k-ing4i1:0eu096k-ing4i1-policy"
terraform import -var-file=environments/terraform.tfvars module.role_1z1sf45_3rieapj.aws_iam_role.this "1z1sf45-3rieapj"
terraform import -var-file=environments/terraform.tfvars 'module.role_1z1sf45_3rieapj.aws_iam_role_policy.this["policy_1"]' "1z1sf45-3rieapj:1z1sf45-3rieapj-policy"
terraform import -var-file=environments/terraform.tfvars module.role_1z1sf45_zflgrfp.aws_iam_role.this "1z1sf45-zflgrfp"
terraform import -var-file=environments/terraform.tfvars 'module.role_1z1sf45_zflgrfp.aws_iam_role_policy.this["policy_1"]' "1z1sf45-zflgrfp:1z1sf45-zflgrfp-policy"
terraform import -var-file=environments/terraform.tfvars module.role_498i03_s0g5wv.aws_iam_role.this "498i03-s0g5wv"
terraform import -var-file=environments/terraform.tfvars 'module.role_498i03_s0g5wv.aws_iam_role_policy.this["policy_1"]' "498i03-s0g5wv:498i03-s0g5wv-policy"
terraform import -var-file=environments/terraform.tfvars module.user_data.aws_subnet.this "subnet-01881cec8b99f3091"