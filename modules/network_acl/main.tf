resource "aws_default_network_acl" "this" {
  default_network_acl_id = var.default_network_acl_id
  subnet_ids             = var.subnet_ids
  tags                   = var.tags

  dynamic "egress" {
    for_each = { for k, v in var.acl_rules : k => v if v.egress }
    content {
      action          = egress.value.rule_action
      cidr_block      = egress.value.cidr_block
      from_port       = 0
      ipv6_cidr_block = egress.value.ipv6_cidr_block
      protocol        = egress.value.protocol
      rule_no         = egress.value.rule_number
      to_port         = 0
    }
  }

  dynamic "ingress" {
    for_each = { for k, v in var.acl_rules : k => v if !v.egress }
    content {
      action          = ingress.value.rule_action
      cidr_block      = ingress.value.cidr_block
      from_port       = 0
      ipv6_cidr_block = ingress.value.ipv6_cidr_block
      protocol        = ingress.value.protocol
      rule_no         = ingress.value.rule_number
      to_port         = 0
    }
  }
}