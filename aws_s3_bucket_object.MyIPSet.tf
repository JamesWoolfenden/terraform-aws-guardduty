resource "aws_s3_bucket_object" "MyIPSet" {
  count  = "${var.ip_set_list_path == "" ? 0 : 1}"
  bucket = aws_s3_bucket.guard_duty_lists.id
  key    = "MyIPSet.txt"
  source = var.ip_set_list_path
  etag   = md5(file("${var.ip_set_list_path}"))
}
