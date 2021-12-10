#--------------------------------------------------------------------------------------
# security group and rules
#--------------------------------------------------------------------------------------
# security group author
module "secgrp-author" {
  source              = "../../../modules/aws_security_group"
  vpc_id              = var.vpcid
  sg_name             = "wxyz-echo-author-access"
  sg_description      = "wxyz echo author access"
  client_name         = var.client_name
  environment_name    = var.environment_name
  application_name    = var.application_name
  application_version = var.application_version
  application_tier    = var.a_tier
}

## INGRESS rules
module "secgrp-author-ingress-rules" {
  source = "../../../modules/aws_security_group_rule"
  ##(default) type = "ingress"
  security_group_id = module.secgrp-author.security_group_id
  rules = {
    "0" = ["201.223.16.0/20", "22", "22", "TCP", "escobar-vpn access"]
    "1" = ["${module.eip-publisher.public_ip}/32", "4502", "4502", "TCP", "Pubs"]
  }
}

## INGRESS rules
module "secgrp-author-ingress-sgrules" {
  source = "../../../modules/aws_security_group_sgrule"
  ##(default) type = "ingress"
  security_group_id = module.secgrp-author.security_group_id
  rules = {
    "0" = ["${module.secgrp-author-alb.security_group_id}", "80", "80", "TCP", "Auth ALB"]
  }
}

## EGRESS rule (terraform does not do this by default)
module "secgrp-author-egress-rules" {
  source            = "../../../modules/aws_security_group_rule"
  type              = "egress"
  security_group_id = module.secgrp-author.security_group_id
  rules = {
    "0" = ["0.0.0.0/0", "0", "65535", "TCP", "allow all outbound"]
  }
}

## security group publisher
module "secgrp-publisher" {
  source              = "../../../modules/aws_security_group"
  vpc_id              = var.vpcid
  sg_name             = "wxyz-echo-publisher-access"
  sg_description      = "wxyz echo publisher access"
  client_name         = var.client_name
  environment_name    = var.environment_name
  application_name    = var.application_name
  application_version = var.application_version
  application_tier    = var.p_tier
}

## INGRESS rules
module "secgrp-publisher-ingress-rules" {
  source            = "../../../modules/aws_security_group_rule"
  type              = "ingress"
  security_group_id = module.secgrp-publisher.security_group_id
  rules = {
    "0" = ["199.223.16.0/20", "22", "22", "TCP", "escobar-vpn access"]
    "1" = ["${module.eip-author.public_ip}/32", "4503", "4503", "TCP", "Author"]
    "2" = ["${module.eip-dispatcher.public_ip}/32", "4503", "4503", "TCP", "Dispatcher"]
  }
}

## INGRESS rules
module "secgrp-publisher-ingress-sgrules" {
  source = "../../../modules/aws_security_group_sgrule"
  ##(default) type = "ingress"
  security_group_id = module.secgrp-publisher.security_group_id
  rules = {
    "0" = ["${module.secgrp-dispatcher.security_group_id}", "4503", "4503", "TCP", "Disp"]
  }
}

## EGRESS rule (terraform does not do this by default)
module "secgrp-publisher-egress-rules" {
  source            = "../../../modules/aws_security_group_rule"
  type              = "egress"
  security_group_id = module.secgrp-publisher.security_group_id
  rules = {
    "0" = ["0.0.0.0/0", "0", "65535", "TCP", "allow all outbound"]
  }
}

## security group dispatcher
module "secgrp-dispatcher" {
  source              = "../../../modules/aws_security_group"
  vpc_id              = var.vpcid
  sg_name             = "wxyz-echo-dispatcher-access"
  sg_description      = "wxyz echo dispatcher access"
  client_name         = var.client_name
  environment_name    = var.environment_name
  application_name    = var.application_name
  application_version = var.application_version
  application_tier    = var.d_tier
}

## INGRESS rules
module "secgrp-dispatcher-ingress-rules" {
  source            = "../../../modules/aws_security_group_rule"
  type              = "ingress"
  security_group_id = module.secgrp-dispatcher.security_group_id
  rules = {
    "0" = ["199.223.16.0/20", "22", "22", "TCP", "escobar-vpn access"]
    "20" = ["${module.eip-author.public_ip}/32", "80", "80", "TCP", "Author"]
    "21" = ["${module.eip-publisher.public_ip}/32", "80", "80", "TCP", "Publisher"]
  }
}

## INGRESS rules
module "secgrp-dispatcher-ingress-sgrules" {
  source = "../../../modules/aws_security_group_sgrule"
  ##(default) type = "ingress"
  security_group_id = module.secgrp-dispatcher.security_group_id
  rules = {
    "0" = ["${module.secgrp-dispatcher-alb.security_group_id}", "80", "80", "TCP", "Disp ALB"]
  }
}

## EGRESS rule (terraform does not do this by default)
module "secgrp-dispatcher-egress-rules" {
  source            = "../../../modules/aws_security_group_rule"
  type              = "egress"
  security_group_id = module.secgrp-dispatcher.security_group_id
  rules = {
    "0" = ["0.0.0.0/0", "0", "65535", "TCP", "allow all outbound"]
  }
}

## security group dispatcher ALB
module "secgrp-dispatcher-alb" {
  source              = "../../../modules/aws_security_group"
  vpc_id              = var.vpcid
  sg_name             = "wxyz-echo-dispatcher-alb"
  sg_description      = "wxyz echo dispatcher alb"
  client_name         = var.client_name
  environment_name    = var.environment_name
  application_name    = var.application_name
  application_version = var.application_version
  application_tier    = var.d_tier
}

## INGRESS rules
module "secgrp-dispatcher-alb-ingress-rules" {
  source            = "../../../modules/aws_security_group_rule"
  type              = "ingress"
  security_group_id = module.secgrp-dispatcher-alb.security_group_id
  rules = {
    "0" = ["0.0.0.0/0", "80", "80", "TCP", "open access"]
    "1" = ["0.0.0.0/0", "443", "443", "TCP", "open access"]
  }
}

## EGRESS rule (terraform does not do this by default)
module "secgrp-dispatcher-alb-egress-rules" {
  source            = "../../../modules/aws_security_group_rule"
  type              = "egress"
  security_group_id = module.secgrp-dispatcher-alb.security_group_id
  rules = {
    "0" = ["0.0.0.0/0", "0", "65535", "TCP", "allow all outbound"]
  }
}

## security group Author ALB
module "secgrp-author-alb" {
  source              = "../../../modules/aws_security_group"
  vpc_id              = var.vpcid
  sg_name             = "wxyz-echo-author-alb"
  sg_description      = "wxyz echo author alb"
  client_name         = var.client_name
  environment_name    = var.environment_name
  application_name    = var.application_name
  application_version = var.application_version
  application_tier    = var.a_tier
}

## INGRESS rules
module "secgrp-author-alb-ingress-rules" {
  source            = "../../../modules/aws_security_group_rule"
  type              = "ingress"
  security_group_id = module.secgrp-author-alb.security_group_id
  rules = {
    "0" = ["0.0.0.0/0", "80", "80", "TCP", "open access"]
    "1" = ["0.0.0.0/0", "443", "443", "TCP", "open access"]
  }
}

## EGRESS rule (terraform does not do this by default)
module "secgrp-author-alb-egress-rules" {
  source            = "../../../modules/aws_security_group_rule"
  type              = "egress"
  security_group_id = module.secgrp-author-alb.security_group_id
  rules = {
    "0" = ["0.0.0.0/0", "0", "65535", "TCP", "allow all outbound"]
  }
}
