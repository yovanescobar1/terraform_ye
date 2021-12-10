resource "aws_subnet" "subnets" {
  count                           = length(var.cidr_block)
  availability_zone               = element(split(",", var.az), count.index)
  #availability_zone_id            = element(split(",", var.az_id), count.index)
  cidr_block                      = var.cidr_block[count.index]
  #ipv6_cidr_block                 = var.ipv6_cidr_block[count.index]
  map_public_ip_on_launch         = var.map_public_ip_on_launch
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  vpc_id                          = var.vpc_id

  tags = {
    "Name"                = "${var.client_name}-${var.environment_name}-${var.application_name}-${var.application_version}-${var.facing}-subnet"
    "Client"              = var.client_name
    "Application Name"    = var.application_name
    "Application Version" = var.application_version
    "Environment"         = var.environment_name
    "Terraform"           = var.terraform_tag
    "Facing"              = var.facing
  }
}

# associate subnets with route table
resource "aws_route_table_association" "rt-assoc" {
  count          = length(var.cidr_block)
  subnet_id      = element(aws_subnet.subnets.*.id, count.index)
  #subnet_id      = aws_route_table_association.rt-assoc[count.index]
  route_table_id = var.route_table_id
}
