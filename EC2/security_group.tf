resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow port 22 dfor SSH access"
  vpc_id      = "vpc-0b239c0bece9d117b"

  #tags = {
  #  Name = "allow_ssh"
  # }
  #}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
