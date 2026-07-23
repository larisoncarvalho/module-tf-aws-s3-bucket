variable "ami_id" {
  type        = string
  description = "AMI ID for the instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "SSH key pair name"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where instance will be launched"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs to attach"
}

variable "private_ip" {
  type        = string
  description = "Private IP address"
}

variable "source_dest_check" {
  type        = bool
  description = "Enable source/destination checking"
}

variable "ebs_optimized" {
  type        = bool
  description = "Enable EBS optimization"
}

variable "monitoring" {
  type        = bool
  description = "Enable detailed monitoring"
}

variable "tenancy" {
  type        = string
  description = "Instance tenancy"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Metadata service HTTP endpoint setting"
}

variable "metadata_http_tokens" {
  type        = string
  description = "Metadata service HTTP tokens requirement"
}

variable "metadata_http_put_response_hop_limit" {
  type        = number
  description = "Metadata service HTTP PUT response hop limit"
}

variable "metadata_http_protocol_ipv6" {
  type        = string
  description = "Metadata service IPv6 protocol setting"
}

variable "metadata_instance_metadata_tags" {
  type        = string
  description = "Instance metadata tags setting"
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type"
}

variable "root_delete_on_termination" {
  type        = bool
  description = "Delete root volume on instance termination"
}

variable "cpu_core_count" {
  type        = number
  description = "Number of CPU cores"
}

variable "cpu_threads_per_core" {
  type        = number
  description = "Number of threads per CPU core"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}