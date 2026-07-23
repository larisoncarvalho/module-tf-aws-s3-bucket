resource "aws_vpc_endpoint" "this" {
  for_each = var.vpc_endpoints

  policy              = each.value.policy
  private_dns_enabled = each.value.private_dns_enabled
  route_table_ids     = each.value.route_table_ids
  security_group_ids  = each.value.security_group_ids
  service_name        = each.value.service_name
  subnet_ids          = each.value.subnet_ids
  vpc_endpoint_type   = each.value.vpc_endpoint_type
  vpc_id              = var.vpc_id
}