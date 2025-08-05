resource "aws_security_group" "allow_ssh" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = "vpc-0b49d3937073325d1"

  tags = var.tags


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.ingress_cidr
  }
}
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = var.subnet_id
  tags                   = var.tags
}
