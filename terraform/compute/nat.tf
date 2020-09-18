resource "aws_instance" "nat" {
	ami = "ami-0fa3a5c016146beec"
	instance_type = "t2.medium"
	key_name = "${var.key_name}"
	security_groups = ["${var.nat_security_group}"]
	subnet_id = "${var.web_subnet_a}"
	associate_public_ip_address = true
	source_dest_check = false
	tags {
		Name = "nat"
	}
}

resource "aws_eip" "nat" {
	instance = "${aws_instance.nat.id}"
	vpc = true
}
