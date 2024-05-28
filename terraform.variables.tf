variable "oci_region" {
  type = string
}

variable "iac_source" {
  type        = string
  default     = "git@git.bdeshi.space:bdeshi/terraform-oci-woodpecker-cache.git"
  description = "Source of the iac config. used in various tags and metadata."
}

variable "iac_component" {
  type        = string
  default     = "oci-woodpecker-cache"
  description = "Component name of the iac config. used in various tags and metadata."
}

variable "remote_state_type" {
  type        = string
  description = "The type of the remote state backend to fetch the compartment_id from"
}

variable "remote_state_config" {
  type        = any
  description = "The configuration of the remote state backend to fetch the compartment_id from"
}
