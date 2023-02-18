# .................### group 1: load balancer
resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Allow inbound from everywhere to port 80 and 443, and all outbound"
  vpc_id      = aws_vpc.comcast_vpc.id

  ingress {
    description      = "inbound HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    description      = "inbound HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

# ..................### group 2: bastion host
resource "aws_security_group" "bastion_host_sg" {
  name        = "bastion_host_sg"
  description = "Allow inbound from any IP to port 22, and all outbound"
  vpc_id      = aws_vpc.comcast_vpc.id

  ingress {
    description      = "any IP to ssh 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}

# .................### group 3: app server
resource "aws_security_group" "app_server_sg" {
  name        = "app_server_sg"
  description = "Allow inbound from alb_sg to port 443"
  vpc_id      = aws_vpc.comcast_vpc.id

  ingress {
    description      = "alb_sg to 443 https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.alb_sg.id}"]
  }

  # for testing............
   ingress {
    description      = "alb_sg to 80 http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  # end of test.......

  ingress {
    description      = "bastion_host_sg to 22 ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.bastion_host_sg.id}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
