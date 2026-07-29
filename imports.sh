#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.glue_catalog_table["temp_bronze_inventory_380e218b"].aws_glue_catalog_table.this' '790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_380e218b'
"$1" import -var-file environments/sg.tfvars 'module.glue_catalog_table["temp_bronze_inventory_381181d5"].aws_glue_catalog_table.this' '790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_381181d5'
"$1" import -var-file environments/sg.tfvars 'module.glue_catalog_table["temp_bronze_inventory_381361b2"].aws_glue_catalog_table.this' '790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_381361b2'
