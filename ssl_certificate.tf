resource "aws_acm_certificate" "comcast-cert" {
  domain_name               = "nazdevops.tk"
  subject_alternative_names = ["*.nazdevops.tk"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}