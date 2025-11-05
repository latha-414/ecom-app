output "bucket_name" {
  description = "S3 bucket name for application artifacts"
  value       = aws_s3_bucket.app_artifacts.bucket
}

output "bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = aws_s3_bucket.app_artifacts.arn
}
