variable "ami_id" {
  type        = string
  default     = "ami-0953476d60561c955"
  description = "This ami id of ec2 instance"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "tags" {
  type = map(any)
  default = {
    Name        = "backend"
    Project     = "expense"
    Environment = "Dev"
    Terraform   = true
  }
}

variable "sg_name" {
  default = "allow_ssh"
}

variable "sg_description" {
  default = "This SG is allow to ssh access through port 22"
}

variable "from_port" {
  default = 22
  type    = number
}

variable "to_port" {
  default = 22
  type    = number
}

variable "ingress_cidr" {
  default = ["0.0.0.0/0"]
}

variable "protocol" {
  default = "tcp"
}
