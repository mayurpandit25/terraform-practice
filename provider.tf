provider "aws" {
    region = "ap-south-1"
    profile = "config"
}

/* terraform {
  backend "s3" {
    bucket = "mayur-s3-amazon-bucket75645"
    region = "ap-south-1"
    key = "terraform.tfstate"
    profile = "config"
    shared_credentials_files = [ "/root/.aws/credentials" ]
    dynamodb_table = "cbz"
  }
} */

