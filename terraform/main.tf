resource "aws_s3_bucket" "app_bucket" {
  bucket = var.app_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = var.app_bucket_name
    Project     = var.project_name
    Environment = "dev"
  }
}