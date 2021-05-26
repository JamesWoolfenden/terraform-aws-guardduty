resource "aws_s3_bucket_public_access_block" "guard_duty_lists" {
  count  = (var.threat_intel_list_path == "") && (var.ip_set_list_path == "") ? 0 : 1
  bucket = aws_s3_bucket.guard_duty_lists[0].id

  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
}
