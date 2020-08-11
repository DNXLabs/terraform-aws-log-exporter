# terraform-aws-log-exporter

terraform-aws-log-exporter creates a lambda function that :

    - Export on the AWS account and region its deployed, every 4 hours,For each log group If it has the tag ExportToS3=true, and The last export was more than 24 hours ago creates an export task to the S3_BUCKET defined, and Save the current timestamp in an SSM parameter.

This module creates:
 - A lambda function
 - A bucket to receive the logs
 - A Cloudwatch to export the logs

 More Information: https://dnxlabs.slab.com/public/9y24trqv


[![Lint Status](https://github.com/DNXLabs/terraform-aws-log-exporter/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-log-exporter/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-log-exporter)](https://github.com/DNXLabs/terraform-aws-log-exporter/blob/master/LICENSE)

Deploys a lambda that:

    On the AWS account and region its deployed,
    Every 4 hours,
    For each log group,
    If it has the tag ExportToS3=true, and
    The last export was more than 24 hours ago,
    Create an export task to S3_BUCKET defined, and
    Save the current timestamp in an SSM parameter.

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |

## Providers

| Name | Version |
|------|---------|
| archive | n/a |
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudwatch\_logs\_export\_bucket | Bucket to export logs | `string` | `""` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-log-exporter/blob/master/LICENSE) for full details.