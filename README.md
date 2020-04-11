# terraform-aws-log-exporter

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudwatch\_logs\_export\_bucket | Bucket to export logs | `string` | `""` | no |

## Outputs

No output.

## Authors

Module managed by [Allan Denot](https://github.com/adenot).

## License

Apache 2 Licensed. See LICENSE for full details.