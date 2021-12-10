variable "cidr_block" {
  description = "(Required) The CIDR block for the subnet."
  default = []
}

variable "az" {
  description = "(Optional) The AZ for the subnet."
}

#variable "az_id" {
#  description = "(Optional) The AZ ID of the subnet."
#  default = ""
#}

#variable "ipv6_cidr_block" {
#  description = "(Optional) The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length."
#  default = ""
#}

variable "map_public_ip_on_launch" {
  description = " (Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false. "
  default = false
}

variable "assign_ipv6_address_on_creation" {
  description = "(Optional) Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false."
  default = false
}

variable "vpc_id" {
  description = "(Required) The VPC ID."
}

variable "client_name" {
  description = "A tag to assign to the resource. Represents client code name (ihgp, vifl)."
}

variable "application_name" {
  description = "A tag to assign to the resource. Represents client application name (aem, sitecore)"
}

variable "application_version" {
  description = "A tag to assign to the resource. Represents client application version (6.4, 9.1)."
}

variable "environment_name" {
  description = "A tag to assign to the resource. Represents client build environment (dev, prod)."
}

variable "terraform_tag" {
  description = "A tag to assign to the resource. Signifies resource created using Terraform. Defaults true."
  default = true
}

variable "facing" {
  description = "A tag to assign to the resource. Signifies public or private facing."
  default = "public"
}

variable "route_table_id" {
  description = "(Required) The ID of the routing table to associate with."
}
