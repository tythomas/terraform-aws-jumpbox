resource "aws_instance" "jumpbox" {
  ami                    = "${var.jumpbox_ami}"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.jumpbox.key_name}"
  vpc_security_group_ids = ["${aws_security_group.jumpbox_security_group.id}"]
  source_dest_check      = false
  subnet_id              = "${var.subnet_id}"
  count                  = 1

  root_block_device {
    volume_type = "gp2"
    volume_size = 150
  }

  tags = "${merge(var.tags, map("Name", "${var.env_name}-jumpbox"))}"
}
