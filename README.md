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
<!-- END_TF_DOCS -->
