resource "aws_instance" "terraform" {
  count                  = length(var.instance_names)
  ami                    = "ami-08a6efd148b1f7504"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = "subnet-02958fb7c88ba45a2"
  #   tags = {
  #     Name = var.instance_names[count.index]
  #   }
  tags = merge(
    var.common_tags,
    {
      Name = var.instance_names[count.index]
    }
  )
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh from port 22"
  vpc_id      = "vpc-0b49d3937073325d1"

  #   tags = {
  #     Name = "allow_ssh_terraform"
  #   }

  tags = merge(
    var.common_tags,
    {
      Name = "allow-ssh"
    }
  )


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
