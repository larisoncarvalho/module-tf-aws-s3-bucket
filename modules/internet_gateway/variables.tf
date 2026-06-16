variable "vpc_id" {
  description = "The VPC ID to attach the Internet Gateway to (references an external VPC not managed in this stack)"
  type        = string
}