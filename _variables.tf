variable "cloudwatch_logs_export_bucket" {
  type        = string
  default     = ""
  description = "Bucket to export logs"
}

variable "runtime" {
  type        = string
  default     = "python3.10"
  description = "Runtime version of the lambda function"
}

variable "s3_prefix" {
  type = string
  default = null
  description = "Key prefix where to store logs, defaulted to aws_account if not set"
}