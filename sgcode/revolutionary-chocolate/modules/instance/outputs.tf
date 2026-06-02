output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.this.private_ip
}

output "key_pair_name" {
  description = "Name of the SSH key pair"
  value       = aws_key_pair.this.key_name
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.this.id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = aws_subnet.this.id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}