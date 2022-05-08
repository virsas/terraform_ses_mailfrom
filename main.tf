provider "aws" {
  region = var.region
}

resource "aws_ses_domain_mail_from" "mail_from" {
  domain           = var.domain
  mail_from_domain = var.from_subdomain
}

resource "aws_route53_record" "mail_from_mx" {
  zone_id = var.zone
  name    = aws_ses_domain_mail_from.mail_from.mail_from_domain
  type    = "MX"
  ttl     = "30"
  records = ["10 feedback-smtp.${var.region}.amazonses.com"]
}

resource "aws_route53_record" "mail_from_txt" {
  zone_id = var.zone
  name    = aws_ses_domain_mail_from.mail_from.mail_from_domain
  type    = "TXT"
  ttl     = "30"
  records = ["v=spf1 include:amazonses.com -all"]
}
