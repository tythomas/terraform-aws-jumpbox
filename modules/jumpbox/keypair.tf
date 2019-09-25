resource "aws_key_pair" "jumpbox" {
  key_name   = "${var.env_name}-jumpbox-key"
  public_key = "${tls_private_key.jumpbox.public_key_openssh}"
}

resource "tls_private_key" "jumpbox" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}
