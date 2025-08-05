variable "ami_id" {
  type        = string
  default     = "ami-08a6efd148b1f7504"
  description = "This is the ami_id of ec2 instance we are going to create"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "instance type"
}

variable "tags" {
  default = {
    Name        = "backend"
    Project     = "expense"
    Environment = "DEV"
    Terraform   = true
  }
}

variable "sg_name" {
  default = "allow_ssh"
}

variable "sg_description" {
  default = "Allow ssh from port 22"
}

variable "from_port" {
  type    = number
  default = 22
}

variable "to_port" {
  type    = number
  default = 22
}

variable "protocol" {
  type    = string
  default = "tcp"
}

variable "ingress_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "subnet_id" {
  default = "subnet-02958fb7c88ba45a2"
}
