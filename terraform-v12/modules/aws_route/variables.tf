variable "route_table_id" {
  description = "(Required) The ID of the routing table."
}

variable "destination_cidr_block" {
  description = "(Optional) The destination CIDR block."
  default = "0.0.0.0/0"
}

variable "destination_ipv6_cidr_block" {
  description = "(Optional) The destination IPv6 CIDR block."
  default = ""
}

variable "egress_only_gateway_id" {
  description = "(Optional) Identifier of a VPC Egress Only Internet Gateway. "
  default = ""
}

variable "gateway_id" {
  description = "(Optional) Identifier of a VPC internet gateway or a virtual private gateway."
  default = ""
}

variable "instance_id" {
  description = "(Optional) Identifier of an EC2 instance. "
  default = ""
}

variable "nat_gateway_id" {
  description = " (Optional) Identifier of a VPC NAT gateway."
  default = ""
}

variable "network_interface_id" {
  description = "(Optional) Identifier of an EC2 network interface. "
  default = ""
}

variable "transit_gateway_id" {
  description = ""
  default = ""
}

variable "vpc_peering_connection_id" {
  description = "(Optional) Identifier of a VPC peering connection."
  default = ""
}

variable "route_create_timeout" {
  description = "Timeout provided for route creation."
  default = "2m"
}

variable "route_delete_timeout" {
  description = "Timeout provided for route deletion."
  default = "5m"
}
