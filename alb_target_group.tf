
# ALB target group
resource "aws_lb_target_group" "comcast" {
  name     = "comcast-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.comcast_vpc.id
}

# attach ALB target group to instance
resource "aws_lb_target_group_attachment" "comcast" {
  target_group_arn = aws_lb_target_group.comcast.arn
  target_id        = aws_instance.appserver_1a.id
  port             = 80
}