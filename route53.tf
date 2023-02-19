resource "aws_route53_zone" "comcast-app" {
  name = "nazdevops.tk"
}

resource "aws_route53_record" "www" {

  # certificate validation; adding in record
   for_each = {
    for dvo in aws_acm_certificate.comcast-cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  } # validation end
#  zone_id = aws_route53_zone.comcast-app.zone_id

  allow_overwrite = true
  zone_id = "Z023320217P2O1T0GPN6C"
  name    = "www.nazdevops.tk"
  type    = "A"
  #ttl     = "60" # time before expiration of record from cache (in seconds)
  
    alias {
    name                   = aws_lb.comcast_alb.dns_name
    zone_id                = aws_lb.comcast_alb.zone_id
    evaluate_target_health = true
  }
}