#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.iam_role.aws_iam_role.this' 'AmazonSageMakerServiceCatalogProductsLaunchRole'
"$1" import -var-file environments/sg.tfvars 'module.iam_role.aws_iam_role_policy_attachment.this["amazonsagemakeradmin_servicecatalogproductsservicerolepolicy"]' 'AmazonSageMakerServiceCatalogProductsLaunchRole/arn:aws:iam::aws:policy/AmazonSageMakerAdmin-ServiceCatalogProductsServiceRolePolicy'