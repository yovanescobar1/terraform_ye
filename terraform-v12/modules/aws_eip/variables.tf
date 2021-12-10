variable "vpc" {
  default = true
}

variable "instance_id" {
  description = "(Optional) The allocation id of the specific VPC EIP to retrieve."
}
