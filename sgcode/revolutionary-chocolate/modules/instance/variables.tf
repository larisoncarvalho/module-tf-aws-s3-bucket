variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the instance"
  type        = string
}

variable "ebs_optimized" {
  description = "Whether EBS optimization is enabled"
  type        = bool
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "metadata_http_endpoint" {
  description = "Metadata service HTTP endpoint state"
  type        = string
}

variable "metadata_http_put_response_hop_limit" {
  description = "Metadata service HTTP PUT response hop limit"
  type        = number
}

variable "metadata_http_tokens" {
  description = "Metadata service HTTP tokens requirement"
  type        = string
}

variable "monitoring" {
  description = "Whether detailed monitoring is enabled"
  type        = bool
}

variable "public_key" {
  description = "Public key material for the key pair"
  type        = string
  sensitive   = true
}

variable "root_volume_delete_on_termination" {
  description = "Whether root volume is deleted on instance termination"
  type        = bool
}

variable "root_volume_encrypted" {
  description = "Whether root volume is encrypted"
  type        = bool
}

variable "root_volume_iops" {
  description = "Root volume IOPS"
  type        = number
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  type        = number
}

variable "root_volume_throughput" {
  description = "Root volume throughput in MB/s"
  type        = number
}

variable "root_volume_type" {
  description = "Root volume type"
  type        = string
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "source_dest_check" {
  description = "Whether source/destination checking is enabled"
  type        = bool
}

variable "subnet_assign_ipv6_address_on_creation" {
  description = "Whether to assign IPv6 addresses on creation"
  type        = bool
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "subnet_ipv6_cidr_block" {
  description = "IPv6 CIDR block for the subnet"
  type        = string
}

variable "subnet_map_public_ip_on_launch" {
  description = "Whether to map public IP on launch"
  type        = bool
}

variable "subnet_name" {
  description = "Name tag for the subnet"
  type        = string
}

variable "subnet_resource_type" {
  description = "Resource-Type tag for the subnet"
  type        = string
}

variable "tenancy" {
  description = "Tenancy of the instance"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_instance_tenancy" {
  description = "Instance tenancy for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "vpc_resource_type" {
  description = "Resource-Type tag for the VPC"
  type        = string
}