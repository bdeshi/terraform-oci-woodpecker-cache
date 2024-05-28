output "s3_bucket_name" {
  value = oci_objectstorage_bucket.woodpecker_cache.name
}

output "s3_endpoint" {
  value = "https://${oci_objectstorage_bucket.woodpecker_cache.namespace}.compat.objectstorage.${var.oci_region}.oraclecloud.com"
}

output "s3_accss_key_id" {
  value = oci_identity_customer_secret_key.woodpecker_cache.id
}

output "s3_secret_access_key" {
  value     = oci_identity_customer_secret_key.woodpecker_cache.key
  sensitive = true
}

output "s3_use_path_style" {
  description = "Use path style access for S3. This is necessary for OCI object storage."
  value       = true
}
