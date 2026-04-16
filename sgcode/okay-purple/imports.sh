#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.iam_role.aws_iam_role.this' 'AmazonSageMakerServiceCatalogProductsApiGatewayRole'
"$1" import -var-file environments/sg.tfvars 'module.iam_role.aws_iam_role_policy_attachment.this["amazonsagemakerservicecatalogproductsapigatewayservicerolepolicy"]' 'AmazonSageMakerServiceCatalogProductsApiGatewayRole/arn:aws:iam::aws:policy/service-role/AmazonSageMakerServiceCatalogProductsApiGatewayServiceRolePolicy'