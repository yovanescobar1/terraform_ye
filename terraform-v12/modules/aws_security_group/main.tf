resource "aws_security_group" "secgrp" {
  name                    = var.sg_name
  description             = var.sg_description
  vpc_id                  = var.vpc_id

  tags = {
    "Name"                = "${var.client_name}-${var.environment_name}-${var.application_tier}-${var.application_version}"
    "Client"              = var.client_name
    "Application Name"    = var.application_name
    "Application Version" = var.application_version
    "Application Tier"    = var.application_tier
    "Environment"         = var.environment_name
    "Terraform"           = var.terraform_tag
  }

  timeouts {
    create = var.security_group_create_timeout
    delete = var.security_group_delete_timeout
  }

  lifecycle {
    create_before_destroy = true
  }
}

# default, allow ingress from self
resource "aws_security_group_rule" "ingress_self_rule" {
  type                    = "ingress"
  self                    = true
  from_port               = 0
  to_port                 = 65535
  protocol                = "-1"
  security_group_id       = aws_security_group.secgrp.id

  lifecycle {
    create_before_destroy = true
  }
}
