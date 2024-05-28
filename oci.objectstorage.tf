data "oci_objectstorage_namespace" "ns" {
  compartment_id = local.compartment_id
}

resource "oci_objectstorage_bucket" "woodpecker_cache" {
  compartment_id = local.compartment_id
  name           = "woodpecker-cache"
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  freeform_tags  = local.default_tags
}

resource "oci_objectstorage_object_lifecycle_policy" "woodpecker_cache" {
  bucket    = oci_objectstorage_bucket.woodpecker_cache.name
  namespace = data.oci_objectstorage_namespace.ns.namespace
  rules {
    is_enabled  = true
    action      = "INFREQUENT_ACCESS"
    name        = "migrate-infrequent-access"
    target      = "objects"
    time_amount = 30
    time_unit   = "DAYS"
  }
  rules {
    is_enabled  = true
    action      = "ARCHIVE"
    name        = "migrate-archive"
    target      = "objects"
    time_amount = 90
    time_unit   = "DAYS"
  }
  rules {
    is_enabled  = true
    action      = "DELETE"
    name        = "delete-old-caches"
    target      = "objects"
    time_amount = 120
    time_unit   = "DAYS"
  }
  rules {
    is_enabled  = true
    action      = "ABORT"
    name        = "cancel-multipart-uploads"
    target      = "multipart-uploads"
    time_amount = "3"
    time_unit   = "DAYS"
  }
}
