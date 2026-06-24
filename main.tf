provider "aws" {
  region = "us-east-1"
}

# Create the S3 bucket for Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "darex-terraform-state-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "darex-terraform-state-bucket"
    Environment = "Dev"
  }
}
