resource "aws_default_network_acl" "this" {
  default_network_acl_id = var.default_network_acl_id
  subnet_ids             = var.subnet_ids

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      action     = ingress.value.action
      cidr_block = ingress.value.cidr_block
      from_port  = ingress.value.from_port
      protocol   = ingress.value.protocol
      rule_no    = ingress.value.rule_no
      to_port    = ingress.value.to_port
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      action     = egress.value.action
      cidr_block = egress.value.cidr_block
      from_port  = egress.value.from_port
      protocol   = egress.value.protocol
      rule_no    = egress.value.rule_no
      to_port    = egress.value.to_port
    }
  }
}