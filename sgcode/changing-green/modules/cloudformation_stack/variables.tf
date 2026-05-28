variable "cloudformation_stacks" {
  type = map(object({
    name             = string
    capabilities     = list(string)
    disable_rollback = bool
    parameters       = map(string)
  }))
  description = "Map of CloudFormation stacks to manage"
  default     = {}
}