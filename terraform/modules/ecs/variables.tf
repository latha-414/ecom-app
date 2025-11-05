##############################
# ECS Module - variables.tf
##############################

variable "project_name" {
  description = "Name of the project (used for naming ECS resources)"
  type        = string
}

variable "backend_image" {
  description = "Docker image URI for backend container"
  type        = string
}

variable "frontend_image" {
  description = "Docker image URI for frontend container"
  type        = string
}

variable "backend_port" {
  description = "Port number on which backend container listens"
  type        = number
}

variable "frontend_port" {
  description = "Port number on which frontend container listens"
  type        = number
}

variable "private_subnets" {
  description = "List of private subnets for backend ECS service"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnets for frontend ECS service"
  type        = list(string)
}

variable "backend_sg_id" {
  description = "Security group ID for backend ECS service"
  type        = string
}

variable "frontend_sg_id" {
  description = "Security group ID for frontend ECS service"
  type        = string
}

variable "backend_target_group_arn" {
  description = "Target group ARN for backend service in ALB"
  type        = string
}

variable "frontend_target_group_arn" {
  description = "Target group ARN for frontend service in ALB"
  type        = string
}

variable "alb_listener_arn" {
  description = "ALB listener ARN for ECS services"
  type        = string
}
