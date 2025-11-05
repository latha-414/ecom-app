variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
  default     = "ecommerce-project"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "backend_port" {
  description = "Backend container port"
  type        = number
  default     = 8080
}

variable "frontend_port" {
  description = "Frontend container port"
  type        = number
  default     = 80
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "github_repo_url" {
  description = "GitHub repository URL"
  type        = string
  default     = "https://github.com/latha-414/SpringBoot-Reactjs-Ecommerce"
}
