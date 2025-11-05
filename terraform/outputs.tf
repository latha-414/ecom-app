output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = module.alb.alb_dns_name
}

output "alb_url" {
  description = "Application URL"
  value       = module.alb.alb_url
}

output "backend_ecr_url" {
  description = "Backend ECR Repository URL"
  value       = module.ecr.backend_repo_url
}

output "frontend_ecr_url" {
  description = "Frontend ECR Repository URL"
  value       = module.ecr.frontend_repo_url
}

output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = module.ecs.ecs_cluster_name
}

output "backend_service_name" {
  description = "Backend ECS Service Name"
  value       = module.ecs.backend_service_name
}

output "frontend_service_name" {
  description = "Frontend ECS Service Name"
  value       = module.ecs.frontend_service_name
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = module.rds.db_endpoint
}

output "s3_bucket_name" {
  description = "S3 bucket for artifacts"
  value       = module.s3.bucket_name
}

output "cloudwatch_dashboard_name" {
  description = "CloudWatch dashboard name"
  value       = module.cloudwatch.dashboard_name
}
