resource "oci_identity_user" "woodpecker_cache" {
  compartment_id = local.tenancy_id
  name           = local.woodpecker_cache_iam_name
  description    = local.woodpecker_cache_iam_name
  freeform_tags  = local.default_tags
}

resource "oci_identity_user_capabilities_management" "woodpecker_cache" {
  user_id                      = oci_identity_user.woodpecker_cache.id
  can_use_customer_secret_keys = "true"
  can_use_api_keys             = "false"
  can_use_auth_tokens          = "false"
  can_use_console_password     = "false"
  can_use_smtp_credentials     = "false"
}

resource "oci_identity_customer_secret_key" "woodpecker_cache" {
  display_name = local.woodpecker_cache_iam_name
  user_id      = oci_identity_user.woodpecker_cache.id
}

resource "oci_identity_group" "woodpecker_cache" {
  compartment_id = local.tenancy_id
  name           = local.woodpecker_cache_iam_name
  description    = local.woodpecker_cache_iam_name
  freeform_tags  = local.default_tags
}

resource "oci_identity_user_group_membership" "woodpecker_cache" {
  group_id = oci_identity_group.woodpecker_cache.id
  user_id  = oci_identity_user.woodpecker_cache.id
}

resource "oci_identity_policy" "woodpecker_cache" {
  compartment_id = local.compartment_id
  description    = local.woodpecker_cache_iam_name
  name           = local.woodpecker_cache_iam_name
  statements = [
    "ALLOW group ${oci_identity_group.woodpecker_cache.name} TO manage objects IN COMPARTMENT '${local.compartment_name}' where all {target.bucket.name = '${oci_objectstorage_bucket.woodpecker_cache.name}'}"
  ]
  freeform_tags = local.default_tags
}
