resource "aws_s3_object" "MyThreatIntelSet" {
  count  = var.threat_intel_list_path == "" ? 0 : 1
  bucket = aws_s3_bucket.guard_duty_lists.0.id
  key    = "MyThreatIntelSet.txt"
  source = var.threat_intel_list_path
  etag   = md5(file("${var.threat_intel_list_path}"))
}
