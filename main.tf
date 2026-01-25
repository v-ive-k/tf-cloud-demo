resource "aws_s3_bucket" "demo" {
  bucket = "vivek-tfc-demo-${random_string.suffix}" # must be globally unique
}

resource "random_string" "suffix" {
  length = 8
  special = false
}