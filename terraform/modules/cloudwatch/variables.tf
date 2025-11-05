variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "ecs_cluster_name" {
  type        = string
  description = "ECS Cluster name"
}

variable "ecs_service_name" {
  type        = string
  description = "ECS Service name"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "alert_email" {
  type        = string
  description = "Email address for SNS alerts"
}
