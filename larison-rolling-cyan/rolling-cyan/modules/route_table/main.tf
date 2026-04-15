resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  tags   = var.tags
}

resource "aws_route" "this" {
  for_each = var.routes

  route_table_id         = aws_route_table.this.id
  destination_cidr_block = each.value.destination_cidr_block
  gateway_id             = each.value.gateway_id
}