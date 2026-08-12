resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = [for r in var.routes : r if r.gateway_id != "local" && r.gateway_id != ""]
    content {
      cidr_block = route.value.cidr_block
      gateway_id = route.value.gateway_id
    }
  }

  tags = var.tags
}
