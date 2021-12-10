variable "sg_name" {
  description = "(Optional, Forces new resource) The name of the security group. If omitted, Terraform will assign a random, unique name."
}

variable "sg_description" {
  description = "(Optional, Forces new resource) The security group description. Defaults to 'Managed by Terraform'."
}

variable "vpc_id" {
  description = "(Optional, Forces new resource) The VPC ID."
}

variable "security_group_create_timeout" {
  description = "(Defaults to 10 mins) Used when launching the instance (until it reaches the initial running state)."
  default = "10m"
}

variable "security_group_delete_timeout" {
  description = "(Defaults to 20 mins) Used when terminating the instance."
  default = "10m"
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

variable "application_tier" {
  description = "A tag to assign to the resource. Represents client application tier (SQL, SOLR, etc.)."
}

variable "environment_name" {
  description = "A tag to assign to the resource. Represents client build environment (dev, prod)."
}

variable "terraform_tag" {
  description = "A tag to assign to the resource. Signifies resource created using Terraform. Defaults true."
  default = true
}
