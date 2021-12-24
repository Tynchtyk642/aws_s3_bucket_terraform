#========================== Module to create s3 bucket ===============================

resource "random_string" "for_bucket" {
    count  = var.bucket_count

    length = 4
    special = false
    number = false
    upper = false
}


resource "aws_s3_bucket" "bucket" {
    count = var.bucket_count

    bucket = "my-bucket-${random_string.for_bucket[count.index].id}"
    acl = var.acl

    versioning {
    enabled = var.versioning_enabled
    }

    dynamic "logging" {
    for_each = var.logging == null ? [] : [1]
    content {
      target_bucket = var.logging["bucket_name"]
      target_prefix = var.logging["prefix"]
    }
  }

}