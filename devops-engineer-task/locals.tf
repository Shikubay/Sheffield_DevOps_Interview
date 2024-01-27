# Declaring repetitive values to be unified
locals {
  ami                = "ami-0500f74cc2b89fb6b"
  instance_type      = ["t2.micro", "t3.large"]
  cidr_block         = { "vpc" = "10.0.0.0/24", "subnet" = "10.0.0.0/28" }
  general_cidr_block = "0.0.0.0/0"
  azs                = element(data.aws_availability_zones.available.names, 2)
  positive           = true
  from_port   = 8080
  to_port     = 65535
}
