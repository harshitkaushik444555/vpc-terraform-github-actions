terraform {

  backend "s3" {
    bucket = "terraform-remote-backend-s3-dec-211"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
