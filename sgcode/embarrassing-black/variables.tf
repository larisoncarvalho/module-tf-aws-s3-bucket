variable "region" {
  description = "The GCP region for the provider"
  type        = string
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "repository_id" {
  description = "The last part of the repository name"
  type        = string
}

variable "format" {
  description = "The format of packages stored in the repository"
  type        = string
}

variable "location" {
  description = "The name of the repository's location"
  type        = string
}

variable "mode" {
  description = "The mode configures the repository to serve artifacts from different sources"
  type        = string
}

variable "labels" {
  description = "Labels with user-defined metadata"
  type        = map(string)
}

variable "cleanup_policy_dry_run" {
  description = "If true, the cleanup pipeline is prevented from deleting versions in this repository"
  type        = bool
}