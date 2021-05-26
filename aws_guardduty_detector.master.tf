resource "aws_guardduty_detector" "master" {
  enable = var.enable
}

resource "aws_guardduty_organization_configuration" "example" {
  auto_enable = true
  detector_id = aws_guardduty_detector.master.id
}
