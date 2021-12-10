resource "aws_vpc" "vpc" {
  cidr_block                       = var.vpc_block
  instance_tenancy                 = var.instance_tenancy
  enable_dns_support               = var.enable_dns_support
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block

  tags = {
    "Name"                = "${var.client_name}-${var.environment_name}-${var.application_name}-${var.application_version}-vpc"
    "Client"              = var.client_name
    "Application Name"    = var.application_name
    "Application Version" = var.application_version
    "Environment"         = var.environment_name
    "Terraform"           = var.terraform_tag
  }
}