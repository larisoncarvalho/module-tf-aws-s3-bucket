resource "aws_instance" "this" {
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone           = var.availability_zone
  ebs_optimized               = var.ebs_optimized
  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = var.monitoring
  source_dest_check           = var.source_dest_check
  subnet_id                   = var.subnet_id
  tenancy                     = var.tenancy
  vpc_security_group_ids      = var.vpc_security_group_ids
}