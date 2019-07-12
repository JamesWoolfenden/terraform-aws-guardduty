data "aws_caller_identity" "current" {}

data "aws_s3_bucket" "log_bucket" {
  bucket = var.log_bucket
}
