resource "aws_route_table" "this" {
  tags   = var.tags
  vpc_id = var.vpc_id
}

resource "aws_route" "this" {
  for_each = var.routes

  destination_cidr_block = each.value.destination_cidr_block
  gateway_id             = each.value.gateway_id
  route_table_id         = aws_route_table.this.id
}

resource "aws_route_table_association" "this" {
  for_each = var.subnet_associations

  route_table_id = aws_route_table.this.id
  subnet_id      = each.value.subnet_id
}