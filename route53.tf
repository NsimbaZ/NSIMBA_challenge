resource "aws_route53_zone" "comcast-app" {
  name = "nazdevops.tk"
}

resource "aws_route53_record" "comcast-app-ns" {

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
  name    = "comcast.nazdevops.tk"
  type    = "CNAME"
  ttl     = "30" # time before expiration of record from cache (in seconds)
  records = [aws_lb.comcast_alb.dns_name] # adds load balancer to record
}