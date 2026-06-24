terraform {
  backend "s3" {
    bucket       = "darex-terraform-state-bucket"
    key          = "terraform/state.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}