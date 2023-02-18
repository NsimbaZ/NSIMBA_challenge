
# instance 1.............app server in AZ private 1a
resource "aws_instance" "appserver_1a" {

  ami                    = "ami-0cc87e5027adcdca8"
  instance_type          = "t2.micro"
  key_name               = var.keypair_name
  monitoring             = true
  security_groups        = [aws_security_group.app_server_sg.id]
  subnet_id              = aws_subnet.public_subnet.id
  associate_public_ip_address = true

  user_data     = <<EOF

    #!/bin/bash
    yum update -y
    yum install -y httpd.x86_64
    systemctl start httpd.service
    systemctl enable httpd.service
    echo “Hello World from $(hostname -f)” > /var/www/html/index.html

  EOF 

  tags = {
    Name        = "${var.vpc_name}_app"
    Terraform   = "true"
  }
}

# instance 2.........Bastion host
resource "aws_instance" "bastion_host" {

  ami                    = "ami-0cc87e5027adcdca8"
  instance_type          = "t2.micro"
  key_name               = var.keypair_name
  monitoring             = true
  security_groups        = [aws_security_group.bastion_host_sg.id]
  subnet_id              = aws_subnet.public_subnet.id
  associate_public_ip_address = true

   user_data     = <<EOF

    #!/bin/bash
    yum update -y
    yum install -y httpd.x86_64
    systemctl start httpd.service
    systemctl enable httpd.service
    echo “Bastion host Hello World from $(hostname -f)” > /var/www/html/index.html

  EOF 

  tags = {
    Name        = "${var.vpc_name}_bastion_host"
    Terraform   = "true"
  }
}