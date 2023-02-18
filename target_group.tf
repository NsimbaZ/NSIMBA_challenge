# target group in availability zone --> a
resource "aws_lb_target_group" "comcast_target_group_az_a" {
  name              = "comcast-target-group-az-a"
  port              = 80
  protocol          = "HTTP"
  protocol_version  = "HTTP1" # version HTTP1 is also default version
  vpc_id            = aws_vpc.comcast_vpc.id
  target_type       = "instance" # type instance is also default type

  health_check {
    protocol        = "HTTP"
    path            = "/"
    #port = # use traffic-port
    healthy_threshold = 5 # consecutive health checks successes required before considering an unhealthy target healthy
    unhealthy_threshold = 2 # consecutive failed attempts before target considered unhealthy
    timeout = 3 # time in seconds to consider no response failed health check
    interval = 25 # time in seconds between health checks for target
    matcher = "200"  # response code has to be HTTP 200 or fails
  }
}

# target group attachment in AZ-a -->1
resource "aws_lb_target_group_attachment" "target_az_a0" {
  target_group_arn = aws_lb_target_group.comcast_target_group_az_a.arn
  target_id        = aws_instance.appserver_1a.id
  port             = 80
}