# internet gateway resource
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.comcast_vpc.id

  tags = {
    Name = "${var.vpc_name}_igw"
  }
}
