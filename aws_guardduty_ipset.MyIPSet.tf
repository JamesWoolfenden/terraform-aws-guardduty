
resource "aws_guardduty_ipset" "MyIPSet" {
  count       = var.ip_set_list_path == "" ? 0 : 1
  activate    = var.ip_set_active
  detector_id = aws_guardduty_detector.master.id
  format      = var.ip_set_format
  location    = "https://s3.amazonaws.com/${aws_s3_object.MyIPSet.0.bucket}/${aws_s3_object.MyIPSet.0.key}"
  name        = "MyIPSet"
}
