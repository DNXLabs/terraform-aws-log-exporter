resource "aws_sqs_queue" "deadletter_queue" {
  name                      = "log-exporter-dlq-${random_string.random.result}"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  tags = {
    Name = "log-exporter-dlq-${random_string.random.result}"
  }
}
