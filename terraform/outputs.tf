output "terraform_state_bucket_id" {
  description = "The ID of the Terraform state S3 bucket"
  value       = aws_s3_bucket.terraform_state.id
}

output "terraform_state_bucket_arn" {
  description = "The ARN of the Terraform state S3 bucket"
  value       = aws_s3_bucket.terraform_state.arn
}

output "terraform_state_bucket_name" {
  description = "The name of the Terraform state S3 bucket"
  value       = aws_s3_bucket.terraform_state.bucket
}
