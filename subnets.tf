# private_subnet....................
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.comcast_vpc.id
  cidr_block = var.vpc_private_subnets[0]
  availability_zone = var.vpc_azs[0]

  tags = {
    Name = "${var.vpc_name}_private_subnet"
  }
}

# public_subnet..........1
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.comcast_vpc.id
  cidr_block = var.vpc_public_subnets[0]
  availability_zone = var.vpc_azs[0]

  tags = {
    Name = "${var.vpc_name}_public_subnet"
  }
}

# public_subnet..........2
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.comcast_vpc.id
  cidr_block = var.vpc_public_subnets[1]
  availability_zone = var.vpc_azs[1]

  tags = {
    Name = "${var.vpc_name}_public_subnet_2"
  }
}