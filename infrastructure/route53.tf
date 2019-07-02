resource "aws_route53_zone" "primary" {
  name = "lorenzo.aiello.family"
}

resource "aws_route53_record" "mx" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "lorenzo.aiello.family"
  type    = "MX"
  ttl     = "300"
  records = ["lorenzo-aiello-family.mail.protection.outlook.com"]
}

resource "aws_route53_record" "spf" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "lorenzo.aiello.family"
  type    = "TXT"
  ttl     = "300"
  records = ["v=spf1 include:spf.protection.outlook.com -all"]
}

resource "aws_route53_record" "autodiscover" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "autodiscover.lorenzo.aiello.family"
  type    = "CNAME"
  ttl     = "300"
  records = ["autodiscover.outlook.com"]
}

resource "aws_route53_record" "cert_validation" {
  name    = aws_acm_certificate.cert.domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options.0.resource_record_type
  zone_id = data.aws_route53_zone.primary.id
  records = [aws_acm_certificate.cert.domain_validation_options.0.resource_record_value]
  ttl     = 60
}
