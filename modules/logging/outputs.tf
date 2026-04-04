output "s3_logs_bucket" {
  value = aws_s3_bucket.logs.id
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.flow_logs.name
}