resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  key_name                    = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  source_dest_check           = var.source_dest_check
  ebs_optimized               = var.ebs_optimized
  monitoring                  = var.monitoring
  tenancy                     = var.tenancy
}