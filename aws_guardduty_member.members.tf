
resource "aws_guardduty_member" "members" {
  count              = var.member_list_count
  account_id         = lookup(var.member_list[count.index], "account_id")
  detector_id        = aws_guardduty_detector.master.id
  email              = lookup(var.member_list[count.index], "member_email")
  invite             = lookup(var.member_list[count.index], "invite")
  invitation_message = "please accept guardduty invitation"
}
