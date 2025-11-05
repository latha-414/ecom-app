# -----------------------------------
# 1. CloudWatch Log Group
# -----------------------------------
resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/ecommerce-app"
  retention_in_days = 14

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# -----------------------------------
# 2. ECS CPU Utilization Alarm
# -----------------------------------
resource "aws_cloudwatch_metric_alarm" "ecs_cpu_alarm" {
  alarm_name          = "ecs-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when ECS CPU > 80%"
  dimensions = {
    ClusterName = var.ecs_cluster_name
    ServiceName = var.ecs_service_name
  }
  alarm_actions = [aws_sns_topic.alerts.arn]
}

# -----------------------------------
# 3. CloudWatch Dashboard
# -----------------------------------
resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "ecommerce-monitoring-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x    = 0,
        y    = 0,
        width  = 12,
        height = 6,
        properties = {
          metrics = [
            ["AWS/ECS", "CPUUtilization", "ClusterName", var.ecs_cluster_name, "ServiceName", var.ecs_service_name]
          ],
          title = "ECS CPU Utilization",
          period = 300,
          stat = "Average",
          region = var.region
        }
      },
      {
        type = "metric",
        x    = 0,
        y    = 6,
        width  = 12,
        height = 6,
        properties = {
          metrics = [
            ["AWS/ECS", "MemoryUtilization", "ClusterName", var.ecs_cluster_name, "ServiceName", var.ecs_service_name]
          ],
          title = "ECS Memory Utilization",
          period = 300,
          stat = "Average",
          region = var.region
        }
      }
    ]
  })
}

# -----------------------------------
# 4. SNS Topic (for alerts)
# -----------------------------------
resource "aws_sns_topic" "alerts" {
  name = "${var.project_name}-alert-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email # your email
}
