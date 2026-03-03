resource "aws_security_group" "runner" {
  description = var.description
  name        = var.name
  vpc_id      = var.vpc_id

  ingress {
    cidr_blocks = ["115.96.62.109/32"]
    description = "SSH"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}