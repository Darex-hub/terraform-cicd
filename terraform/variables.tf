variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "darex-terraform"
}

variable "environment" {
  description = "The deployment environment (dev, staging, production)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "production"], var.environment)
    error_message = "Environment must be one of: dev, staging, production."
  }
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
