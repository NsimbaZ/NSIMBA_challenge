# define public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.comcast_vpc.id 

  route {
    cidr_block = var.route[0] # destination of traffic
    gateway_id = aws_internet_gateway.igw.id # target or where traffic goes through
  }

  tags = {
    Name = "${var.vpc_name}_public"
}
}

# define private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.comcast_vpc.id

  route {
    cidr_block = var.route[0] # destination of traffic
    gateway_id = aws_nat_gateway.nat_gw.id # target or where traffic goes through
  }

  tags = {
    Name = "${var.vpc_name}_private"
}
}