terraform {
  backend "s3" {
    bucket         = "terraform-state-rajender"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
}

