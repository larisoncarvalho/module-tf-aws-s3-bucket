resource "aws_security_group" "this" {
  for_each = var.security_groups

  description = each.value.description
  name        = each.value.name
  tags        = each.value.tags
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = var.ingress_rules

  cidr_ipv4                    = each.value.cidr_ipv4
  description                  = each.value.description
  from_port                    = each.value.from_port
  ip_protocol                  = each.value.ip_protocol
  referenced_security_group_id = each.value.referenced_security_group_id
  security_group_id            = aws_security_group.this[each.value.security_group_key].id
  to_port                      = each.value.to_port
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = var.egress_rules

  cidr_ipv4         = each.value.cidr_ipv4
  description       = each.value.description
  from_port         = each.value.from_port
  ip_protocol       = each.value.ip_protocol
  security_group_id = aws_security_group.this[each.value.security_group_key].id
  to_port           = each.value.to_port
}