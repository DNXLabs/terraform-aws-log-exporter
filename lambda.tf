resource "random_uuid" "lambda_src_hash" {
  keepers = {
    for filename in setunion(
      fileset(path.module, "**.py"),
    ) :
    filename => filemd5("${path.module}/source")
  }
}

data "archive_file" "log_exporter" {
  type        = "zip"
  source_file = "${path.module}/lambda/cloudwatch-to-s3.py"
  output_path = "${path.module}/lambda/tmp/cloudwatch-to-s3.zip"
}

resource "aws_lambda_function" "log_exporter" {
  filename         = data.archive_file.log_exporter.output_path
  function_name    = "log-exporter-${random_string.random.result}"
  role             = aws_iam_role.log_exporter.arn
  handler          = "cloudwatch-to-s3.lambda_handler"
  source_code_hash = data.archive_file.log_exporter.output_base64sha256
  timeout          = 300

  runtime = "python3.8"

  dead_letter_config {
    target_arn = aws_sqs_queue.deadletter_queue.arn
  }

  environment {
    variables = {
      S3_BUCKET   = var.cloudwatch_logs_export_bucket,
      AWS_ACCOUNT = data.aws_caller_identity.current.account_id
    }
  }
}

resource "null_resource" "cleanup_source" {
  triggers = {
    source_version = "${sha1(file("${path.module}/lambda/cloudwatch-to-s3.py"))}"
  }
  provisioner "local-exec" {
    command = "rm -rf ${path.module}/lambda/tmp"
  }
  depends_on = [aws_lambda_function.log_exporter]
}
