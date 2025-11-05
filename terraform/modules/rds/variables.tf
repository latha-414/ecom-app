###################################
# RDS Module - variables.tf
###################################

variable "project_name" {
  description = "Name of the project (used for naming RDS resources)"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, qa, prod)"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for RDS"
  type        = list(string)
}

variable "rds_sg_id" {
  description = "Security Group ID to attach to RDS"
  type        = string
}

variable "db_name" {
  description = "Database name to create in RDS"
  type        = string
  default     = "ecommerce_db"
}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}
