variable "instance_names" {
  type = list(string)
  default = [ "frontend", "backend", "mysql" ]
}

variable "common_tags" {
  type = map
  default = {
    Project = "expense"
    Environment = "dev"
    Terrraform = true
  }
}