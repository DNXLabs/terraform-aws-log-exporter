# terraform-aws-log-exporter

[![Lint Status](https://github.com/DNXLabs/terraform-aws-log-exporter/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-log-exporter/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-log-exporter)](https://github.com/DNXLabs/terraform-aws-log-exporter/blob/master/LICENSE)

This module creates a lambda function that exports log groups on the AWS account and region deployed(default every 4 hours).

It will only export each log group if it has the tag `ExportToS3=true`, if the last export was more than 24 hours ago it creates an export task to the `S3_BUCKET` defined saving the current timestamp in a SSM parameter.

This module creates:
 - A lambda function
 - A bucket to receive the logs
 - A Cloudwatch to export the logs

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| aws | >= 4.61.0 |
| random | >= 3.4.0 |

## Providers

| Name | Version |
|------|---------|
| archive | n/a |
| aws | >= 4.61.0 |
| random | >= 3.4.0 |

## Inputs

| Name                             | Description                                            | Type | Default       | Required |
|----------------------------------|--------------------------------------------------------|------|---------------|:--------:|
| cloudwatch\_logs\_export\_bucket | Bucket to export logs                                  | `string` | `""`          | no |
| s3\_prefix                       | s3 Key where to export logs ( default to AWS_ACCOUNT ) | `string` | `null`         | no |
| runtime                          | Runtime version of the lambda function                 | `string` | `"python3.10"` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-log-exporter/blob/master/LICENSE) for full details.
