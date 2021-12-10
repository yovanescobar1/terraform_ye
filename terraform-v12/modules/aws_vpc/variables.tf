variable "vpc_block" {
  description = "The CIDR block for the VPC."
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC."
  default = "default"
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true."
  default = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
  default = true
}

variable "enable_classiclink" {
  description = "A boolean flag to enable/disable ClassicLink for the VPC."
  default = false
}

variable "enable_classiclink_dns_support" {
  description = "A boolean flag to enable/disable ClassicLink DNS Support for the VPC."
  default = false
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC."
  default = false
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
