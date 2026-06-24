variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name for tagging resources"
  type        = string
  default     = "darex-terraform-project"
}

variable "app_bucket_name" {
  description = "Name of the S3 bucket for application data"
  type        = string
  default     = "darex-app-bucket"
}