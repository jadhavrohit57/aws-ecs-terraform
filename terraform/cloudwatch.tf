resource "aws_cloudwatch_log_group" "cloudwatch" {
  name              = local.service_name
  retention_in_days = 180
}
