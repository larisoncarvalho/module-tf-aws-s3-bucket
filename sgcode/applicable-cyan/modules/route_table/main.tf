resource "aws_route_table" "this" {
  for_each = var.route_tables

  tags   = each.value.tags
  vpc_id = var.vpc_id
}

resource "aws_route" "this" {
  for_each = var.routes

  destination_cidr_block      = each.value.destination_cidr_block
  destination_prefix_list_id  = each.value.destination_prefix_list_id
  gateway_id                  = each.value.gateway_id
  route_table_id              = aws_route_table.this[each.value.route_table_key].id
}

resource "aws_route_table_association" "this" {
  for_each = var.route_table_associations

  route_table_id = aws_route_table.this[each.value.route_table_key].id
  subnet_id      = each.value.subnet_id
}