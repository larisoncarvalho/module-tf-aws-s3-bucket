output "rule_ids" {
  description = "Map of AWS Config rule IDs"
  value       = { for k, v in aws_config_config_rule.this : k => v.rule_id }
}