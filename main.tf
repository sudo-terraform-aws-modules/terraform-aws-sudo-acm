resource "aws_acm_certificate" "acm_cert" {

  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
locals {
  zone_name = var.zone_name == "" ? var.domain_name : var.zone_name

}
data "aws_route53_zone" "route53_acm_validation_zone" {
  provider = aws.route53

  name = local.zone_name
}
resource "aws_route53_record" "route53_acm_validation" {
  provider = aws.route53

  for_each = {
    for dvo in aws_acm_certificate.acm_cert_cloudfront.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.route53_acm_validation_zone.zone_id
}

resource "aws_acm_certificate_validation" "acm_cert_validation" {
  certificate_arn         = aws_acm_certificate.acm_cert_cloudfront.arn
  validation_record_fqdns = [for record in aws_route53_record.route53_acm_validation : record.fqdn]
}
