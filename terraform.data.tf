data "terraform_remote_state" "base" {
  backend = var.remote_state_type
  config  = var.remote_state_config
}
