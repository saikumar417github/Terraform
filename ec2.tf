resource "aws_security_group" "allow_ssh" {
  name        = var.sg_name
  description = var.sg_description

  tags = {
    Name = var.sg_name
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.ingress_cidr
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "terraform" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = "subnet-08439c192ee2373b4"

  tags = var.tags
}
