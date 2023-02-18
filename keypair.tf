resource "aws_key_pair" "tf_key" {
  key_name   = var.keypair_name
  public_key = tls_private_key.rsa.public_key_openssh
}

# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# create local file
resource "local_file" "tf_key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "${var.keypair_name}.pem"
}