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