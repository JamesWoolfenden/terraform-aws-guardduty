output "GuardDuty" {
  description = "The GuardDuty detector"
  value       = aws_guardduty_detector.master
}
