output "arn" {
  value       = aws_acm_certificate.acm_cert.arn
  description = "ARN of the ACM certificate."
}

output "domain_name" {
  value       = aws_acm_certificate.acm_cert.domain_name
  description = "Primary domain name of the ACM certificate."
}

output "status" {
  value       = aws_acm_certificate.acm_cert.status
  description = "Status of the ACM certificate (PENDING_VALIDATION, ISSUED, etc.)."
}

output "validation_record_fqdns" {
  value       = [for record in aws_route53_record.route53_acm_validation : record.fqdn]
  description = "FQDNs of the DNS validation records created in Route53."
}
