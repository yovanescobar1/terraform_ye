variable "vpc_id" {
  description = "VPC id to be derived from VPC."
}

# variable "ngw_subnet_id" {
# }

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