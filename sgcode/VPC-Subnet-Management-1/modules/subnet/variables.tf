variable "cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IPs on launch"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the subnet"
  type        = map(string)
  default     = {}
}
