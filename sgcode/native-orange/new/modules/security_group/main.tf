resource "aws_security_group" "this" {
  description = var.description
  name        = var.name
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = var.ingress_rules

  cidr_ipv4         = each.value.cidr_ipv4
  from_port         = each.value.from_port
  ip_protocol       = each.value.ip_protocol
  security_group_id = aws_security_group.this.id
  to_port           = each.value.to_port
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = var.egress_rules

  cidr_ipv4         = each.value.cidr_ipv4
  cidr_ipv6         = each.value.cidr_ipv6
  ip_protocol       = each.value.ip_protocol
  security_group_id = aws_security_group.this.id
}