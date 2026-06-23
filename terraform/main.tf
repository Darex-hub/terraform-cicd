resource "aws_s3_bucket" "darex" {
  bucket = "darex-terraform-bucket"
  acl    = "private"
}