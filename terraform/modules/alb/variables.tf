###################################
# ALB Module - variables.tf
###################################

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, qa, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets for ALB"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security group ID to associate with ALB"
  type        = string
}

variable "backend_port" {
  description = "Port on which backend application listens"
  type        = number
  default     = 8080
}

variable "frontend_port" {
  description = "Port on which frontend application listens"
  type        = number
  default     = 80
}
