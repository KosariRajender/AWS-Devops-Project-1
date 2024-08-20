// it is used to provide to install aws pluggins >.terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.62.0"
    }
  }
}
// these are the access and secret keys to connect to my aws console through code
provider "aws" {
  region     = var.region
}
 
