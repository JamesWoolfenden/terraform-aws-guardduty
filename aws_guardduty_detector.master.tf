resource "aws_guardduty_detector" "master" {
  enable = var.enable
}
