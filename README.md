# terraform-aws-log-exporter

[![Lint Status](https://github.com/DNXLabs/terraform-aws-log-exporter/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-log-exporter/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-log-exporter)](https://github.com/DNXLabs/terraform-aws-log-exporter/blob/master/LICENSE)

This terraform modules creates a lambda function that :
- Export on the AWS account and region its deployed, every 4 hours,For each log group If it has the tag ExportToS3=true, and The last export was more than 24 hours ago creates an export task to the S3_BUCKET defined, and Save the current timestamp in an SSM parameter.

This module creates :
 - A lambda function
 - A bucket to receive the logs
 - A Cloudwatch to export the logs

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