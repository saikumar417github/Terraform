resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow port 22 dfor SSH access"
  vpc_id      = "vpc-0b239c0bece9d117b"

  tags = {
    Name = "allow_ssh"
  }

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

  resource "aws_instance" "terrafrom" {
    ami                    = "ami-00a929b66ed6e0de6"
    instance_type          = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
      Name = "terraform"
    }
  }
}
