variable "bucket_count" {}
variable "acl" {}
variable "versioning_enabled" {}
variable "logging" {
  type = object({
    bucket_name = string
    prefix      = string
  })
  default     = null
  description = "Bucket access logging configuration."
}
