resource "aws_security_group" "ALB-web" {
  name   = "ALB-web"
  vpc_id = "${module.vpc.vpc_id}"
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ALB-Pro" {
  name   = "ALB-PRO"
  vpc_id = "${module.vpc.vpc_id}"
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "PRO" {
  name   = "PRO"
  vpc_id = "${module.vpc.vpc_id}"
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
    security_groups = ["${aws_security_group.OVPN.id}"]
  }

  ingress {
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
    security_groups = ["${aws_security_group.PRE.id}"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["192.168.0.0/24"]
    description = "Red Valentina"
  }
}

resource "aws_security_group" "rds-aurora" {
  name   = "rds-aurora"
  vpc_id = "${module.vpc.vpc_id}"
  ingress {
    from_port       = 3306
    protocol        = "tcp"
    to_port         = 3306
    security_groups = ["${aws_security_group.PRE.id}", "${aws_security_group.PRO.id}", "${aws_security_group.OVPN.id}", "${aws_security_group.dms.id}"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# # resource "aws_security_group" "rds-aurora-quicksight" { 
# #     name = "rds-aurora-quicksight" 
# #     vpc_id = "${module.vpc.vpc_id}" 
# #     ingress { 
# #         from_port = 3306 
# #         protocol = "tcp" 
# #         to_port = 3306 
# #         cidr_blocks = ["52.210.255.224/27"] # CIDR de servidores Quicksight 
# #     } 
# #     egress { 
# #         from_port = 0 
# #         protocol = "-1" 
# #         to_port = 0 
# #         cidr_blocks = ["0.0.0.0/0"] 
# #     } 
# # } 

# # resource "aws_security_group" "s3sync-lambda" { 
# #     name = "s3sync-lambda" 
# #     vpc_id = "${module.vpc.vpc_id}" 
# #     ingress { 
# #         from_port = 0 
# #         protocol = "-1" 
# #         to_port = 0 
# #         security_groups = ["${aws_security_group.PRE.id}"] // (Lambda tiene que conectarse a desarrollo) 
# #     } 
# #     egress { 
# #         from_port = 0 
# #         protocol = "-1" 
# #         to_port = 0 
# #         cidr_blocks = ["0.0.0.0/0"] 
# #     } 
# # } 

resource "aws_security_group" "PRE" {
  name   = "PRE"
  vpc_id = "${module.vpc.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["${aws_security_group.OVPN.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "webPRO" {
  name   = "webPRO"
  vpc_id = "${module.vpc.vpc_id}"
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
    security_groups = ["${aws_security_group.PRE.id}"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "EFS" {
  name   = "EFS"
  vpc_id = "${module.vpc.vpc_id}"
  ingress {
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_groups = ["${aws_security_group.PRO.id}", "${aws_security_group.PRE.id}"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_security_group" "EFS-PRE" {
#   name   = "EFS-PRE"
#   vpc_id = "${module.vpc.vpc_id}"
#   ingress {
#     from_port       = 0
#     protocol        = "-1"
#     to_port         = 0
#     security_groups = ["${aws_security_group.PRE.id}"]
#   }
#   egress {
#     from_port   = 0
#     protocol    = "-1"
#     to_port     = 0
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

resource "aws_security_group" "memcached" {
  name   = "rds-memcached"
  vpc_id = "${module.vpc.vpc_id}"
  ingress {
    from_port       = 6379
    protocol        = "tcp"
    to_port         = 6379
    security_groups = ["${aws_security_group.PRE.id}", "${aws_security_group.PRO.id}"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "OVPN" {
  name   = "OVPN"
  vpc_id = "${module.vpc.vpc_id}"

  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh to cloud9"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["34.245.205.0/27"]
  }

  ingress {
    description = "ssh to cloud9"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["34.245.205.64/27"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "dms" {
  name   = "dms"
  vpc_id = "${module.vpc.vpc_id}"

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
