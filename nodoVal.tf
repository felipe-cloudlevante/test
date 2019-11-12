# resource "aws_instance" "test" {
#   instance_type           = "t3.micro"
#   ami                     = "ami-040ba9174949f6de4"
#   subnet_id               = "${element(module.vpc.public_subnets, 0)}"
#   vpc_security_group_ids  = ["${aws_security_group.PRO.id}"]
  
#   tags = {
#          Name = "nodo"
#   }

# }
