resource "aws_security_group" "sg" {
  for_each = toset(["sg1dev", "sg1prod"]) # creating multiple security groups with different names using loop
  name     = each.value
  vpc_id   = aws_vpc.public-vpc.id
  ingress {
    from_port   = local.from_port
    to_port     = local.to_port
    protocol    = "tcp"
    cidr_blocks = ["${local.general_cidr_block}"]
  }
}
