resource "aws_s3_bucket" "s3_bucket" {
    region = "ap-south-1"
    bucket = "mayur-s3-amazon-bucket54367"

    tags   = {
        Name = "mayur-s3-amazon-bucket54367"
    }

    lifecycle {
      prevent_destroy = true
    }
}

/* resource "random_id" "rand_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "demo-bucket-${terraform.workspace}-${random_id.rand_id.hex}"
}
 */