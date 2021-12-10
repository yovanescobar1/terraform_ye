resource "aws_internet_gateway" "igw" {
  vpc_id        = var.vpc_id

  tags = {
    "Name"                = "${var.client_name}-${var.environment_name}-${var.application_name}-${var.application_version}-igw"
    "Client"              = var.client_name
    "Application Name"    = var.application_name
    "Application Version" = var.application_version
    "Environment"         = var.environment_name
    "Terraform"           = var.terraform_tag
  }
}

# resource "aws_eip" "nat" {
#   vpc      = true
# }

# resource "aws_nat_gateway" "ngw" {
#   allocation_id = "${aws_eip.nat.id}"
#   subnet_id     = "${var.ngw_subnet_id}"

#   tags = {
#     "Name"                = "${var.client_name}-${var.application_name}-${var.application_version}-${var.environment_name}-ngw"
#     "Client"              = "${var.client_name}"
#     "Application Name"    = "${var.application_name}"
#     "Application Version" = "${var.application_version}"
#     "Environment"         = "${var.environment_name}"
#     "Terraform"           = "${var.terraform_tag}"
#   }

#   depends_on = ["aws_internet_gateway.igw"]
# }
