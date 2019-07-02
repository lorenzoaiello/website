resource "aws_acm_certificate" "cert" {
  provider          = aws.east
  domain_name       = "lorenzo.aiello.family"
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [aws_route53_record.cert_validation.fqdn]
}