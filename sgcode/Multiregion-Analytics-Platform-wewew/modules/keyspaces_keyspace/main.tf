resource "aws_keyspaces_keyspace" "this" {
  name = var.name
  tags = var.tags

  replication_specification {
    replication_strategy = var.replication_strategy
  }
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
