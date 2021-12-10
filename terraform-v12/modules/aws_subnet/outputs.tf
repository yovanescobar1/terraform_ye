output "id" {
  value = aws_subnet.subnets.*.id
}

output "arn" {
  value = aws_subnet.subnets.*.arn
}

#output "ipv6_cidr_block_association_id" {
#  value = aws_subnet.subnets.*.ipv6_cidr_block_association_id
#}

output "owner_id" {
  value = aws_subnet.subnets.*.owner_id
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

output "aws_route_table_association_id" {
  value = aws_route_table_association.rt-assoc.*.id
}
