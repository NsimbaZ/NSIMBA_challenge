resource "aws_vpc" "comcast_vpc" {

  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${var.vpc_name}"
    Terraform = "true"
  }
}