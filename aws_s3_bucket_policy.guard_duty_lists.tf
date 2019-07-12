resource "aws_s3_bucket_policy" "guard_duty_lists" {
  count  = "${(var.threat_intel_list_path == "") && (var.ip_set_list_path == "")  ? 0 : 1}"
  bucket = aws_s3_bucket.guard_duty_lists.id
  policy = data.aws_iam_policy_document.guard_duty_lists.json
}
