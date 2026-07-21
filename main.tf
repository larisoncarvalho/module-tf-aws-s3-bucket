module "glue_catalog_table" {
  source   = "./modules/glue_catalog_table"
  for_each = var.glue_catalog_tables

  catalog_id    = each.value.catalog_id
  database_name = each.value.database_name
  name          = each.value.name
  owner         = each.value.owner
  table_type    = each.value.table_type
  parameters    = each.value.parameters

  storage_descriptor = each.value.storage_descriptor
}
