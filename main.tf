provider "aws" {
  region = "us-east-1"
}

module "bucket" {
    source = "./s3"

    bucket_count = 10
    acl = "private"
    versioning_enabled = false
}