variable "listener_arn" {
}
variable "priority" {
  default = "100"
}
variable "type" {
  default = "forward"
}
variable "target_group_arn" {
}
variable "field" {
  default = "path-pattern"
}
variable "values" {
  default = "/*"
}


