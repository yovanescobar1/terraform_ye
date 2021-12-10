output "arn" {
  value = aws_vpc.vpc.arn
}

output "id" {
  value = aws_vpc.vpc.id
}

output "cidr_block" {
  value = aws_vpc.vpc.cidr_block
}

output "instance_tenancy" {
  value = aws_vpc.vpc.instance_tenancy
}

output "enable_dns_support" {
  value = aws_vpc.vpc.enable_dns_support
}

output "enable_dns_hostnames" {
  value = aws_vpc.vpc.enable_dns_hostnames
}

output "enable_classiclink" {
  value = aws_vpc.vpc.enable_classiclink
}

output "main_route_table_id" {
  value = aws_vpc.vpc.main_route_table_id
}

output "default_network_acl_id" {
  value = aws_vpc.vpc.default_network_acl_id
}

output "default_security_group_id" {
  value = aws_vpc.vpc.default_security_group_id
}

output "default_route_table_id" {
  value = aws_vpc.vpc.default_route_table_id
}

output "ipv6_association_id" {
  value = aws_vpc.vpc.ipv6_association_id
}

output "ipv6_cidr_block" {
  value = aws_vpc.vpc.ipv6_cidr_block
}

output "owner_id" {
  value = aws_vpc.vpc.owner_id
}

output "client_name" {
  value = var.client_name
}

output "application_name" {
  value = var.application_name
}

output "application_version" {
  value = var.application_version
}

output "environment_name" {
  value = var.environment_name
}

output "terraform_tag" {
  value = var.terraform_tag
}
