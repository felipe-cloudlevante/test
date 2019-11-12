module "vpc" {
  version = "~> 2.0"
  source  = "terraform-aws-modules/vpc/aws"

  name = "vpc-pipe"
  cidr = "172.20.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b"]
  private_subnets = ["172.20.1.0/24", "172.20.2.0/24"]
  public_subnets  = ["172.20.101.0/24", "172.20.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = "pipe"
  }
}
