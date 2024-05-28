terraform {
  required_version = "~> 1.8.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.42.0"
    }
  }

  backend "remote" {}
}

provider "oci" {
  region = var.oci_region
}
