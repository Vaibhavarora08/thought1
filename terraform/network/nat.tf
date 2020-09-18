resource "aws_security_group" "nat" {
        name = "nat"
        description = "Allow services from the private subnet through NAT"
        vpc_id = "${var.mw_vpc}"

        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
                from_port = 443
                to_port = 443
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
                from_port = 0
                to_port = 65535
                protocol = "tcp"
                security_groups = ["${aws_security_group.mw_sg_private.id}"]
        }

        ingress {
                from_port = 0
                to_port = 65535
                protocol = "udp"
                security_groups = ["${aws_security_group.mw_sg_private.id}"]
        }

        egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }

        }
     
