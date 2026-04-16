#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.iam_role.aws_iam_role.this' 'AmazonSageMakerServiceCatalogProductsCloudformationRole'
"$1" import -var-file environments/sg.tfvars 'module.iam_role.aws_iam_role_policy_attachment.this["amazonsagemakercatalogproductscloudformationservicerolepolicy"]' 'AmazonSageMakerServiceCatalogProductsCloudformationRole/arn:aws:iam::aws:policy/service-role/AmazonSageMakerServiceCatalogProductsCloudformationServiceRolePolicy'