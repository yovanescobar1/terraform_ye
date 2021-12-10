variable "type" {
  default = "ingress"
}

variable "rules" {
  type = map
  default = {
    "0" = ["","","","",""]
  }
}

variable "security_group_id" {
}