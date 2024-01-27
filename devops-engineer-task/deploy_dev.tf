resource "aws_instance" "web_dev" {
    count                       = 3
  ami                         = local.ami
  instance_type               = local.instance_type[0]
  vpc_security_group_ids      = [aws_security_group.sg["sg1dev"].id]
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = local.positive
  user_data                   = file("./script.sh")
  user_data_replace_on_change = local.positive

  tags = {
    Name = "web${count.index + 1}-dev"
  }
  # indicating a depency for the resource block
  depends_on = [
    aws_security_group.sg
    ]
}
