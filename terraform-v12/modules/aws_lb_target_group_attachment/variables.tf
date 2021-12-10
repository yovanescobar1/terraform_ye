variable "target_group_arn" {
  description = "(Required) The ARN of the target group with which to register targets."
  default = ""
}

variable "target_id" {
  description = "(Required) The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address. If the target type is lambda, specify the arn of lambda."
  default = ""
}

variable "port" {
  description = "(Optional) The port on which targets receive traffic."
  default = "80"
}

variable "availability_zone" {
  description = "(Optional) The Availability Zone where the IP address of the target is to be registered."
  default = ""
}
