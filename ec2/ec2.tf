resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh from port 22"
  vpc_id      = "vpc-0b49d3937073325d1"

  tags = {
    Name = "allow_ssh_terraform"
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

}
