resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  tags   = var.tags

  dynamic "route" {
    for_each = var.routes
    content {
      cidr_block                = route.value.cidr_block
      ipv6_cidr_block           = route.value.ipv6_cidr_block
      gateway_id                = route.value.gateway_id
      nat_gateway_id            = route.value.nat_gateway_id
      network_interface_id      = route.value.network_interface_id
      transit_gateway_id        = route.value.transit_gateway_id
      vpc_peering_connection_id = route.value.vpc_peering_connection_id
      egress_only_gateway_id    = route.value.egress_only_gateway_id
    }
  }
}
