resource "aws_guardduty_threatintelset" "MyThreatIntelSet" {
  count       = var.threat_intel_list_path == "" ? 0 : 1
  activate    = var.threat_intel_set_active
  detector_id = aws_guardduty_detector.master.id
  format      = var.threat_intel_set_format
  location    = "https://s3.amazonaws.com/${aws_s3_bucket_object.MyThreatIntelSet.0.bucket}/${aws_s3_bucket_object.MyThreatIntelSet.0.key}"
  name        = "MyThreatIntelSet"
}
