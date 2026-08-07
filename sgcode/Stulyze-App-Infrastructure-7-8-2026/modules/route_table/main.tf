resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.routes
    content {
      cidr_block     = route.value.cidr_block != "" ? route.value.cidr_block : null
      gateway_id     = route.value.gateway_id != "" ? route.value.gateway_id : null
      nat_gateway_id = route.value.nat_gateway_id != "" ? route.value.nat_gateway_id : null
    }
  }

  tags = var.tags
}
