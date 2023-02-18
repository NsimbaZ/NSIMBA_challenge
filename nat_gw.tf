# nat gateway public subnet 1_a
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "${var.vpc_azs[0]}_nat_gw"
  }

  depends_on = [aws_internet_gateway.igw]
}