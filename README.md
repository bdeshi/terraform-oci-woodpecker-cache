# oci woodpecker cache

sets up a cache bucket on oci for use with [woodpecker ci](https://woodpecker-ci.org/).

depends on [terraform-oci-free](https://git.bdeshi.space/bdeshi/terraform-oci-free).

## Usage

```bash
terraform init -backend-config=terraform.backend.tfvars
terraform apply -var-file=terraform.tfvars
```

Collect the output values and create woodpecker ci user-level variables, eg:

```yaml
CACHE_S3_ENDPOINT: <s3_endpoint>
CACHE_S3_BUCKET: <s3_bucket_name>
CACHE_S3_ACCESS_KEY_ID: <s3_access_key_id>
CACHE_S3_SECRET_ACCESS_KEY: <s3_secret_access_key>
CACHE_USE_PATH_STYLE: true
```

these variables can then be used with the [drone-cache](https://github.com/meltwater/drone-cache/)
plugin in a woodpecker ci pipeline.

<!-- markdownlint-disable -->

# Terraform Docs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 5.42.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 5.42.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_identity_customer_secret_key.woodpecker_cache](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_customer_secret_key) | resource |
| [oci_identity_group.woodpecker_cache](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_group) | resource |
| [oci_identity_policy.woodpecker_cache](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_policy) | resource |
| [oci_identity_user.woodpecker_cache](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_user) | resource |
| [oci_identity_user_capabilities_management.woodpecker_cache](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_user_capabilities_management) | resource |
| [oci_identity_user_group_membership.woodpecker_cache](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_user_group_membership) | resource |
| [oci_objectstorage_bucket.woodpecker_cache](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/objectstorage_bucket) | resource |
| [oci_objectstorage_object_lifecycle_policy.woodpecker_cache](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/objectstorage_object_lifecycle_policy) | resource |
| [oci_objectstorage_namespace.ns](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/objectstorage_namespace) | data source |
| [terraform_remote_state.base](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oci_region"></a> [oci\_region](#input\_oci\_region) | n/a | `string` | n/a | yes |
| <a name="input_remote_state_config"></a> [remote\_state\_config](#input\_remote\_state\_config) | The configuration of the remote state backend to fetch the compartment\_id from | `any` | n/a | yes |
| <a name="input_remote_state_type"></a> [remote\_state\_type](#input\_remote\_state\_type) | The type of the remote state backend to fetch the compartment\_id from | `string` | n/a | yes |
| <a name="input_iac_component"></a> [iac\_component](#input\_iac\_component) | Component name of the iac config. used in various tags and metadata. | `string` | `"oci-woodpecker-cache"` | no |
| <a name="input_iac_source"></a> [iac\_source](#input\_iac\_source) | Source of the iac config. used in various tags and metadata. | `string` | `"git@git.bdeshi.space:bdeshi/terraform-oci-woodpecker-cache.git"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_accss_key_id"></a> [s3\_accss\_key\_id](#output\_s3\_accss\_key\_id) | n/a |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | n/a |
| <a name="output_s3_endpoint"></a> [s3\_endpoint](#output\_s3\_endpoint) | n/a |
| <a name="output_s3_secret_access_key"></a> [s3\_secret\_access\_key](#output\_s3\_secret\_access\_key) | n/a |
| <a name="output_s3_use_path_style"></a> [s3\_use\_path\_style](#output\_s3\_use\_path\_style) | Use path style access for S3. This is necessary for OCI object storage. |
<!-- END_TF_DOCS -->
