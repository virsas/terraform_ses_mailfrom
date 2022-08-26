# terraform_ses_mailfrom

Terraform module to create SES mail from subdomain for feedback and bounce configuration

##  Dependencies

- Route53 - <https://github.com/virsas/terraform_route53>
- SES Domain - <https://github.com/virsas/terraform_ses_domain>

## Files

- None

## Terraform example

``` terraform
##############
# Variable
##############
# Not needed

##############
# Module
##############
module "ses_mailfrom_example" {
  source = "git::https://github.com/virsas/terraform_ses_mailfrom.git?ref=v1.0.0"
  domain = module.ses_domain_example.domain
  zone = module.route53_example_org.zone_id
  from_subdomain = "bounce.example.org"
}
```

## Outputs

- none