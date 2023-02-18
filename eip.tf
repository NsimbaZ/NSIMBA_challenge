# eip for nat gateway
resource "aws_eip" "nat_gw" {
  #instance = aws_instance.web.id
  vpc      = true
}
