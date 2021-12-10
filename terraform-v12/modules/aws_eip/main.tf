resource "aws_eip" "eip" {
  vpc = var.vpc
  instance = var.instance_id
}
