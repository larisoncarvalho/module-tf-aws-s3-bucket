resource "aws_vpc_endpoint" "this" {
  vpc_id              = var.vpc_id
  service_name        = var.service_name
  vpc_endpoint_type   = var.vpc_endpoint_type
  route_table_ids     = var.route_table_ids
  policy              = var.policy
  tags                = var.tags
}