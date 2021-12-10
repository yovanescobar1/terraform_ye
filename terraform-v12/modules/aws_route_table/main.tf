resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  tags = {
    "Name"                = "${var.client_name}-${var.environment_name}-${var.application_name}-${var.application_version}-rt-table"
    "Client"              = var.client_name
    "Application Name"    = var.application_name
    "Application Version" = var.application_version
    "Environment"         = var.environment_name
    "Terraform"           = var.terraform_tag
  }
}

# sets our custom route table as main route table for VPC
#resource "aws_main_route_table_association" "main_assoc" {
#  vpc_id         = var.vpc_id
#  route_table_id = aws_route_table.rt.id
#}
