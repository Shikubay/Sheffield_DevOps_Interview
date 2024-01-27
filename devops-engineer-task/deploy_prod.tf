resource "aws_instance" "web_prod" {
  count                       = 3
  ami                         = local.ami
  instance_type               = local.instance_type[1]
  vpc_security_group_ids      = [aws_security_group.sg["sg1prod"].id]
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = local.positive
  user_data                   = file("./script.sh")
  user_data_replace_on_change = local.positive

  tags = {
    Name = "web${count.index + 1}-prod"
  }

  # indicating a depency for the resource block
  depends_on = [
    aws_security_group.sg
    ]
}
