output "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch log group used for ECS logs"
  value       = aws_cloudwatch_log_group.ecs_log_group.name
}

output "cloudwatch_dashboard_name" {
  description = "Name of the CloudWatch dashboard for ECS monitoring"
  value       = aws_cloudwatch_dashboard.ecs_dashboard.dashboard_name
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic used for CloudWatch alerts"
  value       = aws_sns_topic.alerts.arn
}

output "sns_subscription_email" {
  description = "Email address subscribed to the SNS alert topic"
  value       = aws_sns_topic_subscription.email_subscription.endpoint
}
