locals {

  tenancy_id       = data.terraform_remote_state.base.outputs.tenancy_id
  compartment_id   = data.terraform_remote_state.base.outputs.compartment_id
  compartment_name = data.terraform_remote_state.base.outputs.compartment_name
  default_tags = {
    ManagedBy       = "iac/terraform"
    "iac/source"    = var.iac_source
    "iac/component" = var.iac_component
  }
  woodpecker_cache_iam_name = "woodpecker-cache-operator"
}
