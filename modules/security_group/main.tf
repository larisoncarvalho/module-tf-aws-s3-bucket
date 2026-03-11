resource "aws_security_group" "this" {
  description = var.description
  name        = var.name
  vpc_id      = var.vpc_id
  tags        = var.tags
}

resource "aws_security_group_rule" "this" {
  for_each = var.rules

  security_group_id = aws_security_group.this.id
  type              = each.value.type

  cidr_blocks              = each.value.cidr_blocks
  description              = each.value.description
  from_port                = each.value.from_port
  ipv6_cidr_blocks         = each.value.ipv6_cidr_blocks
  protocol                 = each.value.protocol
  self                     = each.value.self
  source_security_group_id = each.value.source_security_group_id
  to_port                  = each.value.to_port
}