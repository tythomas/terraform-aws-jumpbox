resource "aws_route53_record" "jumpbox_attached_eip" {
  name    = "jumpbox.${var.env_name}.${var.dns_suffix}"
  zone_id = "${var.zone_id}"
  type    = "A"
  ttl     = 300
  count   = "1"

  records = ["${aws_instance.jumpbox.private_ip}"]
}
