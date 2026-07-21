#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.glue_catalog_table["temp_bronze_inventory_35dcc724"].aws_glue_catalog_table.this' '790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_35dcc724'
