output "arn" {
  description = "value of the ACM certificate ARN"
  value       = aws_acm_certificate.acm_cert_cloudfront.arn
}
