variable "instance_names" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]
}

# variable "zone_id" {
#   default = "Z04314102925OARNA3D6"
# }

variable "domain_name" {
  default = "aws143.xyz"
}
