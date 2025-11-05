###################################
# RDS Module - outputs.tf
###################################

output "rds_endpoint" {
  description = "RDS endpoint address"
  value       = aws_db_instance.rds.endpoint
}

output "rds_port" {
  description = "RDS port number"
  value       = aws_db_instance.rds.port
}

output "rds_instance_id" {
  description = "RDS instance identifier"
  value       = aws_db_instance.rds.id
}
