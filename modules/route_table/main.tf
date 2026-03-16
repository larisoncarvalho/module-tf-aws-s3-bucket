resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  tags   = var.tags
}

resource "aws_route" "this" {
  for_each = var.routes

  destination_prefix_list_id = each.value.destination_prefix_list_id
  gateway_id                 = each.value.gateway_id
  route_table_id             = aws_route_table.this.id
}

resource "aws_route_table_association" "this" {
  for_each = var.associations

  route_table_id = aws_route_table.this.id
  subnet_id      = each.value.subnet_id
}